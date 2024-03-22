cmake_minimum_required(VERSION 3.5)

set(EXTRA_COMPONENT_DIRS "${EXTRA_COMPONENT_DIRS}" "./../../." "../components")
# Append the directories to the EXTRA_COMPONENT_DIRS variable
list(APPEND EXTRA_COMPONENT_DIRS "./../../." "../components")
include($ENV{IDF_PATH}/tools/cmake/project.cmake)
project(esp32_servo_subs)

# CMakeLists in this exact order for cmake to work correctly
cmake_minimum_required(VERSION 3.5)


