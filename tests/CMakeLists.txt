
file(GLOB TEST_SOURCES *.cpp)
add_executable(RunTest ${TEST_SOURCES})

target_link_libraries(RunTest PRIVATE banking gtest gmock gtest_main)

target_include_directories(RunTest PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../banking
)

enable_testing()
include(GoogleTest)
gtest_discover_tests(RunTest)
