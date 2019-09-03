
add_library(${PROJECT_NAME} SHARED
    mylib.cpp
)

set_target_properties(${PROJECT_NAME} PROPERTIES VERSION ${PROJECT_VERSION})

