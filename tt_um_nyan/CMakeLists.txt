cmake_minimum_required(VERSION 3.16)

project(tt08-nyan LANGUAGES CXX)

find_package(Qt5 REQUIRED COMPONENTS Widgets OpenGL)
find_package(verilator REQUIRED)

file(GLOB VERILOG_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/hdl/*.v)

qt5_generate_moc(sim/window.h ${CMAKE_CURRENT_BINARY_DIR}/moc_window.cpp)
qt5_generate_moc(sim/monitor.h ${CMAKE_CURRENT_BINARY_DIR}/moc_monitor.cpp)

add_executable(tt08-nyan
    sim/main.cpp
    sim/monitor.cpp
    sim/simulator.cpp
    sim/window.cpp
    ${CMAKE_CURRENT_BINARY_DIR}/moc_window.cpp
    ${CMAKE_CURRENT_BINARY_DIR}/moc_monitor.cpp
)
target_include_directories(tt08-nyan PRIVATE sim)
target_compile_features(tt08-nyan PRIVATE cxx_std_20)
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(tt08-nyan PRIVATE -Wall -W -Wextra -Wno-unused-parameter -Wno-unused-variable -Wno-sign-compare $<$<CONFIG:Release>:-march=native -flto>)
endif()
target_link_libraries(tt08-nyan PRIVATE $<$<CONFIG:Release>:-flto>)
target_link_libraries(tt08-nyan PRIVATE Qt5::Widgets Qt5::OpenGL)

verilate(tt08-nyan
    TOP_MODULE tt_um_nyan
    OPT_FAST "-O3 -march=native"
    VERILATOR_ARGS -Wall -I${CMAKE_CURRENT_SOURCE_DIR}/src
    SOURCES
    src/tt_um_nyan.v
    src/graphics.v
    src/music.v
)

add_executable(make_bitmaps tools/make_bitmaps.cpp)
target_compile_features(make_bitmaps PRIVATE cxx_std_20)
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(make_bitmaps PRIVATE -Wall -W -Wextra -Wpedantic)
endif()

add_executable(make_music tools/make_music.cpp)
target_compile_features(make_music PRIVATE cxx_std_20)
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(make_music PRIVATE -Wall -W -Wextra -Wpedantic)
endif()
