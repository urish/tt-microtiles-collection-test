#include "simulator.h"

#include "monitor.h"

#include <chrono>
#include <iostream>
#include <thread>

namespace tt08
{

Simulator::Simulator(Monitor* monitor)
    : m_context(std::make_shared<Context>())
{
    m_context->top.clk = 0;
    m_context->top.ui_in = 0;
    m_context->top.uio_in = 0;
    m_context->top.ena = 0;
    m_context->top.clk = 0;
    m_context->top.rst_n = 0;

    m_context->monitor = monitor;
}

Simulator::~Simulator()
{
    m_context->stopPending.store(true, std::memory_order_release);

    std::unique_lock<std::mutex> lock(m_context->mutex);
    m_context->stopCondition.wait(lock);
}

void Simulator::setValue(Input input, bool value)
{
    auto val = static_cast<unsigned int>(input);

    if (value)
    {
        m_context->nextInputs.store(m_context->nextInputs.load(std::memory_order_relaxed) | (1 << val), std::memory_order_release);
    }
    else
    {
        m_context->nextInputs.store(m_context->nextInputs.load(std::memory_order_relaxed) & ~(1 << val), std::memory_order_release);
    }
}

void Simulator::startRecording()
{
    m_context->recording.store(true, std::memory_order_release);
}

void Simulator::stopRecording()
{
    m_context->recording.store(false, std::memory_order_release);
}

void Simulator::run()
{
    auto context = m_context;
    std::thread thread([context]()
    {
        while (step(*context))
        {
        }
        finish(*context);
    });
    thread.detach();
}

bool Simulator::step(Context& context)
{
    if (context.stopPending.load(std::memory_order_acquire))
    {
        return false;
    }

    auto now = std::chrono::high_resolution_clock::now();
    if (std::chrono::duration_cast<std::chrono::nanoseconds>(now - context.lastStep).count() < 40)
    {
        std::this_thread::sleep_until(context.lastStep + std::chrono::nanoseconds(40));
    }

    auto inputs = context.nextInputs.load(std::memory_order_acquire);
    context.top.ui_in = static_cast<std::uint8_t>(inputs >> static_cast<unsigned int>(Input::Input0));
    context.top.uio_in = static_cast<std::uint8_t>(inputs >> static_cast<unsigned int>(Input::Bidir0));
    context.top.ena = (inputs & (1 << static_cast<unsigned int>(Input::Enable))) ? 1 : 0;
    context.top.rst_n = (inputs & (1 << static_cast<unsigned int>(Input::Reset))) ? 1 : 0;
    context.top.clk ^= 1;

    context.top.eval();
    if (context.top.clk == 1)
    {
        updateMonitor(context);
        updateAudio(context);
    }

    return true;
}

void Simulator::updateMonitor(Context& context)
{
    // PMod signal      HS B0 G0 R0 VS B1 G1 R1

    auto pmod = context.top.uo_out;
    bool hsync = (pmod & 0x80) != 0;
    bool vsync = (pmod & 0x08) != 0;

    if (!hsync && context.column >= s_horizontalBackPorch && context.column < s_width + s_horizontalBackPorch &&
        !vsync && context.row >= s_verticalBackPorch && context.row < s_height + s_verticalBackPorch)
    {
        // Encoding is RRRGGGBB

        auto x = context.column - s_horizontalBackPorch;
        auto y = context.row - s_verticalBackPorch;

        auto red = (((pmod & 0x01) << 1) | ((pmod & 0x10) >> 4)) * 85;
        auto green = (((pmod & 0x02) << 0) | ((pmod & 0x20) >> 5)) * 85;
        auto blue = (((pmod & 0x04) >> 1) | ((pmod & 0x40) >> 6)) * 85;

        context.monitor->setPixel(x, y, red, green, blue);
    }

    if (!hsync)
    {
        ++context.column;
    }
    if (context.oldHsync && !hsync)
    {
        context.column = 0;
        ++context.row;
    }
    if (context.oldVsync && !vsync)
    {
        context.row = 0;
    }

    context.oldHsync = hsync;
    context.oldVsync = vsync;
}

void Simulator::updateAudio(Context& context)
{
    enum class WaveFormat : std::uint16_t
    {
        Pcm = 1
    };

    struct ChunkHeader
    {
        std::array<char, 4> id;
        std::uint32_t size;
    };

    struct RiffHeader
    {
        std::array<char, 4> type;
    };

    struct FmtHeader
    {
        WaveFormat format;
        std::uint16_t channelCount;
        std::uint32_t samplesPerSec;
        std::uint32_t bytesPerSec;
        std::uint16_t blockAlign;
        std::uint16_t bitsPerSample;
    };
    
    auto input = context.top.uio_out >> 7;
    if (input == 1)
    {
        ++context.pwm_high;
    }
    ++context.pwm_pos;
    if (context.pwm_pos == 260)
    {
        if (context.recording.load(std::memory_order_acquire))
        {
            auto sample = static_cast<std::uint16_t>((static_cast<float>(context.pwm_high) / 260.0) * 65535.0);
            context.samples.push_back(sample);

            if (context.samples.size() == 96000)
            {
                if (!context.stream.is_open())
                {
                    context.stream.open("recording.wav", std::ofstream::out | std::ofstream::trunc | std::ofstream::binary);

                    ChunkHeader chunkHeader;
                    chunkHeader.id = {'R', 'I', 'F', 'F'};
                    chunkHeader.size = sizeof(RiffHeader) + sizeof(ChunkHeader) + sizeof(FmtHeader) + sizeof(ChunkHeader) + context.samples.size() * 2;
                    context.stream.write(reinterpret_cast<const char*>(&chunkHeader), sizeof(chunkHeader));

                    RiffHeader riffHeader;
                    riffHeader.type = {'W', 'A', 'V', 'E'};
                    context.stream.write(reinterpret_cast<const char*>(&riffHeader), sizeof(riffHeader));

                    chunkHeader.id = {'f', 'm', 't', ' '};
                    chunkHeader.size = sizeof(FmtHeader);
                    context.stream.write(reinterpret_cast<const char*>(&chunkHeader), sizeof(chunkHeader));

                    FmtHeader fmtHeader;
                    fmtHeader.format = WaveFormat::Pcm;
                    fmtHeader.channelCount = 1;
                    fmtHeader.samplesPerSec = 96000;
                    fmtHeader.bytesPerSec = 96000 * 2 * 1;
                    fmtHeader.blockAlign = 2 * 1;
                    fmtHeader.bitsPerSample = 16;
                    context.stream.write(reinterpret_cast<const char*>(&fmtHeader), sizeof(fmtHeader));

                    chunkHeader.id = {'d', 'a', 't', 'a'};
                    chunkHeader.size = context.samples.size() * 2;
                    context.stream.write(reinterpret_cast<const char*>(&chunkHeader), sizeof(chunkHeader));
                }
                else
                {
                    context.stream.seekp(0, std::ofstream::end);
                    context.stream.write(reinterpret_cast<const char*>(context.samples.data()), context.samples.size() * 2);

                    unsigned int fileSize = context.stream.tellp();
                    
                    std::uint32_t chunkSize = fileSize - sizeof(ChunkHeader);
                    context.stream.seekp(4, std::ofstream::beg);
                    context.stream.write(reinterpret_cast<const char*>(&chunkSize), sizeof(chunkSize));

                    chunkSize = fileSize - sizeof(ChunkHeader) - sizeof(RiffHeader) - sizeof(ChunkHeader) - sizeof(FmtHeader);
                    context.stream.seekp(sizeof(ChunkHeader) + sizeof(RiffHeader) + sizeof(ChunkHeader) + sizeof(FmtHeader) + 4);
                    context.stream.write(reinterpret_cast<const char*>(&chunkSize), sizeof(chunkSize));
                }

                context.samples.clear();
                context.stream.flush();
            }
        }
        else
        {
            if (context.stream.is_open())
            {
                context.stream.close();
            }
        }

        context.pwm_pos = 0;
        context.pwm_high = 0;

    }
}

void Simulator::finish(Context& context)
{
    context.top.final();

    std::lock_guard<std::mutex> lock(context.mutex);
    context.stopCondition.notify_one();
}

} // namespace tt08