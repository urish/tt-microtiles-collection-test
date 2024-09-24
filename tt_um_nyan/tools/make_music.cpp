#include <array>
#include <cstdint>
#include <cstdlib>
#include <exception>
#include <fstream>
#include <iostream>
#include <map>
#include <string_view>
#include <utility>
#include <vector>

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

static void makeMusic(const char* filename)
{
    enum class Note
    {
        G_Sharp,
        F_Sharp,
        D_Sharp,
        D,
        C_Sharp,
        B
    };
    enum class Length
    {
        Short,
        Long
    };
    auto melody = std::to_array<std::pair<Note, Length>>({
        {Note::F_Sharp, Length::Long},
        {Note::G_Sharp, Length::Long},

        {Note::D, Length::Short},
        {Note::D_Sharp, Length::Long},
        {Note::B, Length::Short},

        {Note::D, Length::Short},
        {Note::C_Sharp, Length::Short},
        {Note::B, Length::Long},

        {Note::B, Length::Long},
        {Note::C_Sharp, Length::Long},

        {Note::D, Length::Long},
        {Note::D, Length::Short},
        {Note::C_Sharp, Length::Short},

        {Note::B, Length::Short},
        {Note::C_Sharp, Length::Short},
        {Note::D_Sharp, Length::Short},
        {Note::F_Sharp, Length::Short},

        {Note::G_Sharp, Length::Short},
        {Note::D_Sharp, Length::Short},
        {Note::F_Sharp, Length::Short},
        {Note::C_Sharp, Length::Short},

        {Note::D, Length::Short},
        {Note::B, Length::Short},
        {Note::C_Sharp, Length::Short},
        {Note::B, Length::Short}
    });

    std::map<Note, unsigned int> frequencies({
        {Note::G_Sharp, 415},
        {Note::F_Sharp, 370},
        {Note::D_Sharp, 311},
        {Note::D, 294},
        {Note::C_Sharp, 277},
        {Note::B, 247}
    });

    unsigned int sampleRate = 48000;
    unsigned int sampleSize = 65536;
    unsigned int tickWidth = 28 * sampleRate / 256 / 4;
    unsigned int shortSamples = tickWidth * 3;
    unsigned int longSamples = tickWidth * 7;
    unsigned int spaceSamples = tickWidth;

    std::vector<std::int16_t> samples;
    std::int16_t sample = 0;

    unsigned int totalSamples = 0;
    for (auto [note, length] : melody)
    {
        totalSamples += (length == Length::Short ? shortSamples : longSamples) + spaceSamples;
        auto increment = (sampleSize * 2 - 1) * frequencies[note] / sampleRate;
        for (unsigned int i = 0; i != (length == Length::Short ? shortSamples : longSamples); ++i)
        {   
            samples.push_back(sample);
            sample += increment;
        }
        sample = 0;
        for (unsigned int i = 0; i != spaceSamples; ++i)
        {
            samples.push_back(sample);
        }
    }

    std::cout << totalSamples << " samples" << std::endl;

    std::ofstream file;
    file.exceptions(std::ofstream::badbit | std::ofstream::failbit);
    file.open(filename, std::ofstream::out | std::ofstream::trunc | std::ofstream::binary);

    ChunkHeader chunkHeader;
    chunkHeader.id = {'R', 'I', 'F', 'F'};
    chunkHeader.size = sizeof(RiffHeader) + sizeof(ChunkHeader) + sizeof(FmtHeader) + sizeof(ChunkHeader) + samples.size() * 2;
    file.write(reinterpret_cast<const char*>(&chunkHeader), sizeof(chunkHeader));

    RiffHeader riffHeader;
    riffHeader.type = {'W', 'A', 'V', 'E'};
    file.write(reinterpret_cast<const char*>(&riffHeader), sizeof(riffHeader));

    chunkHeader.id = {'f', 'm', 't', ' '};
    chunkHeader.size = sizeof(FmtHeader);
    file.write(reinterpret_cast<const char*>(&chunkHeader), sizeof(chunkHeader));

    FmtHeader fmtHeader;
    fmtHeader.format = WaveFormat::Pcm;
    fmtHeader.channelCount = 1;
    fmtHeader.samplesPerSec = sampleRate;
    fmtHeader.bytesPerSec = sampleRate * 2 * 1;
    fmtHeader.blockAlign = 2 * 1;
    fmtHeader.bitsPerSample = 16;
    file.write(reinterpret_cast<const char*>(&fmtHeader), sizeof(fmtHeader));

    chunkHeader.id = {'d', 'a', 't', 'a'};
    chunkHeader.size = samples.size() * 2;
    file.write(reinterpret_cast<const char*>(&chunkHeader), sizeof(chunkHeader));

    file.write(reinterpret_cast<const char*>(samples.data()), samples.size() * 2);
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        std::cerr << "Usage: make_music FILE" << std::endl;
        return EXIT_FAILURE;
    }

    try
    {
        makeMusic(argv[1]);
        return EXIT_SUCCESS;
    }
    catch (const std::exception& exception)
    {
        std::cerr << "Caught exception: " << exception.what() << std::endl;
        return EXIT_FAILURE;
    }
}