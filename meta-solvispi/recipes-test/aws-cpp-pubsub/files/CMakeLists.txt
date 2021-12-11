cmake_minimum_required(VERSION 3.1)
# note: cxx-17 requires cmake 3.8, cxx-20 requires cmake 3.12
project(basic-pub-sub CXX)

file(GLOB SRC_FILES
       "*.cpp"
)

add_executable(${PROJECT_NAME} ${SRC_FILES})

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 14)

aws_use_package(aws-crt-cpp)

#set warnings
if (MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE /W4 /WX /wd4068)
else ()
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wno-long-long -pedantic -Werror)
endif ()

set(DEP_DC_LIBS ${DEP_DC_LIBS} aws-crt-cpp aws-c-mqtt aws-c-auth aws-c-io aws-c-cal aws-c-http aws-c-compression aws-c-common aws-c-s3 aws-c-event-stream aws-checksums s2n)
target_link_libraries(${DC_PROJECT_NAME} ${DEP_DC_LIBS})


find_package(aws-crt-cpp REQUIRED)

target_link_libraries(${PROJECT_NAME} AWS::aws-crt-cpp)