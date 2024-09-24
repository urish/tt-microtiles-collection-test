#include "window.h"

#include <QCheckBox>
#include <QGridLayout>
#include <QHBoxLayout>
#include <QSizePolicy>
#include <QSpacerItem>
#include <QVBoxLayout>

namespace tt08
{

Window::Window(QWidget* parent)
    : QWidget(parent)
{
    buildUI();

    m_timer.setSingleShot(false);
    connect(&m_timer, &QTimer::timeout, this, &Window::refreshMonitor);
    m_timer.start(std::chrono::milliseconds(17));
}

void Window::buildUI()
{
    auto verticalLayout = new QVBoxLayout(this);

    // Graphicsview

    auto horizontalLayout = new QHBoxLayout();
    horizontalLayout->addItem(new QSpacerItem(0, 0, QSizePolicy::Expanding, QSizePolicy::Minimum));
    
    m_monitor = new Monitor(this);
    m_monitor->setContentsMargins(0, 0, 0, 0);

    QSizePolicy sizePolicy(QSizePolicy::Fixed, QSizePolicy::Fixed);
    sizePolicy.setHorizontalStretch(0);
    sizePolicy.setVerticalStretch(0);
    sizePolicy.setHeightForWidth(m_monitor->sizePolicy().hasHeightForWidth());
    m_monitor->setSizePolicy(sizePolicy);
    m_monitor->setMinimumSize(QSize(800, 525));
    m_monitor->setMaximumSize(QSize(800, 525));

    horizontalLayout->addWidget(m_monitor);

    horizontalLayout->addItem(new QSpacerItem(0, 0, QSizePolicy::Expanding, QSizePolicy::Minimum));

    verticalLayout->addLayout(horizontalLayout);

    // Buttons

    auto gridLayout = new QGridLayout();
    gridLayout->setContentsMargins(0, 0, 0, 0);

    for (std::size_t i = 0; i != m_inputButtons.size(); ++i)
    {
        auto input = new QCheckBox(this);
        gridLayout->addWidget(input, i, 0, 1, 1);
        connect(input, &QCheckBox::stateChanged, [this, i](int state)
        {
            onInputChanged(i, state);
        });
        m_inputButtons[i] = input;
    }

    for (std::size_t i = 0; i != m_bidirButtons.size(); ++i)
    {
        auto input = new QCheckBox(this);
        gridLayout->addWidget(input, i, 1, 1, 1);
        connect(input, &QCheckBox::stateChanged, [this, i](int state)
        {
            onBidirChanged(i, state);
        });
        m_bidirButtons[i] = input;
    }

    m_enableButton = new QCheckBox(this);
    gridLayout->addWidget(m_enableButton, m_inputButtons.size(), 0, 1, 1);
    connect(m_enableButton, &QCheckBox::stateChanged, this, &Window::onEnableChanged);

    m_resetButton = new QCheckBox(this);
    gridLayout->addWidget(m_resetButton, m_bidirButtons.size(), 1, 1, 1);
    connect(m_resetButton, &QCheckBox::stateChanged, this, &Window::onResetChanged);

    m_recordButton = new QCheckBox(this);
    gridLayout->addWidget(m_recordButton, m_inputButtons.size() + 1, 0, 1, 1);
    connect(m_recordButton, &QCheckBox::stateChanged, this, &Window::onRecordChanged);

    verticalLayout->addLayout(gridLayout);

    retranslateUI();

    m_simulator = std::make_unique<Simulator>(m_monitor);
    m_simulator->run();
}

void Window::retranslateUI()
{
    setWindowTitle(tr("TinyTapeout 8 Contest Simulator"));
    
    for (std::size_t i = 0; i != m_inputButtons.size(); ++i)
    {
        m_inputButtons[i]->setText(tr("Input %1").arg(i));
    }
    for (std::size_t i = 0; i != m_bidirButtons.size(); ++i)
    {
        m_bidirButtons[i]->setText(tr("Bidirectional %1").arg(i));
    }
    m_enableButton->setText("Enable");
    m_resetButton->setText("Reset (active low)");
    m_recordButton->setText("Record");
}

void Window::onResetChanged(int state)
{
    m_simulator->setValue(Simulator::Input::Reset, state == Qt::CheckState::Checked);
}

void Window::onEnableChanged(int state)
{
    m_simulator->setValue(Simulator::Input::Enable, state == Qt::CheckState::Checked);
}

void Window::onInputChanged(std::size_t idx, int state)
{
    m_simulator->setValue(static_cast<Simulator::Input>(static_cast<unsigned int>(Simulator::Input::Input0) + idx), state == Qt::CheckState::Checked);
}

void Window::onBidirChanged(std::size_t idx, int state)
{
    m_simulator->setValue(static_cast<Simulator::Input>(static_cast<unsigned int>(Simulator::Input::Bidir0) + idx), state == Qt::CheckState::Checked);
}

void Window::onRecordChanged(int state)
{
    if (state == Qt::CheckState::Checked)
    {
        m_simulator->startRecording();
    }
    else
    {
        m_simulator->stopRecording();
    }
}

void Window::refreshMonitor()
{
    m_monitor->update();
}


} // namespace tt08