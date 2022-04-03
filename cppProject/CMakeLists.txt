cmake_minimum_required(VERSION 3.21)
project(cppProject)

include_directories(/Library/Developer/CommandLineTools/usr/include)
set(CMAKE_CXX_STANDARD 17)

add_executable(cppProject "test_folder/playground.cpp")
