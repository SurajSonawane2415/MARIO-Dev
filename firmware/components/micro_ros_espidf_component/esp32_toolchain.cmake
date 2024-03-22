include(CMakeForceCompiler)

set(CMAKE_SYSTEM_NAME Generic)

set(idf_target "esp32")
set(idf_path "/home/suraj02/esp/esp-idf")

if("${idf_target}" STREQUAL "esp32c3")
    set(CMAKE_SYSTEM_PROCESSOR riscv)
    set(FLAGS "-ffunction-sections -fdata-sections" CACHE STRING "" FORCE)
else()
    set(CMAKE_SYSTEM_PROCESSOR xtensa)
    set(FLAGS "-mlongcalls -ffunction-sections -fdata-sections" CACHE STRING "" FORCE)
endif()

set(CMAKE_CROSSCOMPILING 1)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(PLATFORM_NAME "LwIP")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_C_COMPILER /home/suraj02/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch5-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc)
set(CMAKE_CXX_COMPILER /home/suraj02/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch5-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-g++)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${FLAGS} ${IDF_INCLUDES}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-rtti ${FLAGS} ${IDF_INCLUDES}")

add_compile_definitions(ESP_PLATFORM LWIP_IPV4 LWIP_IPV6 PLATFORM_NAME_FREERTOS)

include_directories(
        "/home/suraj02/micro_ros_espidf_component/examples/int32_sub_pub/build/config"
        ${idf_path}/components/soc/${idf_target}/include
    )
