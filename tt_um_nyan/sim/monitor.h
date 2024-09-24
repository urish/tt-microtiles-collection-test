#pragma once

#include <QOpenGLWidget>

#include <cstdint>
#include <vector>

namespace tt08
{

class Monitor : public QOpenGLWidget
{
    Q_OBJECT

public:
    explicit Monitor(QWidget* parent = nullptr);

    void setPixel(unsigned int x, unsigned int y, std::uint8_t red, std::uint8_t green, std::uint8_t blue) noexcept
    {
        if (x < m_width && y < m_width)
        {
            m_pixels[(m_height - y - 1) * m_width + x] = 
                (static_cast<std::uint16_t>(red & 0xF0) << 8) |
                (static_cast<std::uint16_t>(green & 0xF0) << 4) |
                (blue & 0xF0) |
                0x0F;
        }
    }

protected:
    void initializeGL() override;
    void paintGL() override;
    void resizeGL(int width, int height) override;

private:
    std::vector<std::uint16_t> m_pixels;
    unsigned int m_width = 0;
    unsigned int m_height = 0;
};

} // namespace tt08