cmake_minimum_required(VERSION 3.21)
project(cppProject)

set(CMAKE_CXX_STANDARD 14)

add_executable(cppProject bitwise_shifter.cpp lab_experiments/sizeof_direct.cpp)
