cmake_minimum_required(VERSION 3.16)
project(markenium LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(PROJECT_HOMEPAGE_URL "https://github.com/voidwaler/markenium")
set(PROJECT_DESCRIPTION "A simple markdown editor.")
set(PROJECT_COPYRIGHT "Copyright (C) 2026")

find_package(Qt6 REQUIRED COMPONENTS Widgets)

add_executable(markenium
    src/main.cpp
	src/MyWidget.cpp
	src/MyWidget.h
)

target_link_libraries(markenium PRIVATE Qt6::Widgets)
