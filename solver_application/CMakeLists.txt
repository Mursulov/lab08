cmake_minimum_required(VERSION 3.10)
project(solver)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Подключаем библиотеки


# Создаем исполняемый файл
add_executable(solver equation.cpp)

# Линкуем библиотеки
target_link_libraries(solver formatter_ex solver_lib)

# Указываем пути к заголовкам
target_include_directories(solver PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_lib
    ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib
    ${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib
)
include(InstallRequiredSystemLibraries)

set(CPACK_PACKAGE_NAME "solver")
set(CPACK_PACKAGE_VENDOR "Terragroup Inc.")
set(CPACK_PACKAGE_CONTACT "maks10122003m@gmail.com")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Solver Application")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "0")
set(CPACK_PACKAGE_VERSION_PATCH "0")

set(CPACK_GENERATOR "DEB;RPM;ZIP")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Maks")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libc6 (>= 2.27)")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")

include(CPack)

