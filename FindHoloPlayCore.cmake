find_path(HoloPlayCore_INCLUDE_DIR
  NAMES HoloPlayCore.h
  HINTS
    ${CMAKE_CURRENT_SOURCE_DIR}/../../../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/include
    ${CMAKE_CURRENT_SOURCE_DIR}/../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/include
    ${CMAKE_CURRENT_BINARY_DIR}/../../../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/include
    ${CMAKE_CURRENT_BINARY_DIR}/../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/include
  DOC "HoloPlayCore.h include directory")

find_library(HoloPlayCore_LIBRARY
  NAMES HoloPlayCore
  HINTS
    ${CMAKE_CURRENT_SOURCE_DIR}/../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/dylib/linux
    ${CMAKE_CURRENT_SOURCE_DIR}/../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/dylib/macos
    ${CMAKE_CURRENT_SOURCE_DIR}/../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/dylib/Win64
    ${CMAKE_CURRENT_BINARY_DIR}/../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/dylib/linux
    ${CMAKE_CURRENT_BINARY_DIR}/../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/dylib/macos
    ${CMAKE_CURRENT_BINARY_DIR}/../HoloPlayCoreSDK-0.2.0/HoloPlayCoreSDK-master/HoloPlayCore/dylib/Win64
  DOC "HoloPlayCore library")

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(HoloPlayCore
  REQUIRED_VARS HoloPlayCore_LIBRARY HoloPlayCore_INCLUDE_DIR
)

if (HoloPlayCore_FOUND)
  set(HoloPlayCore_INCLUDE_DIRS "${HoloPlayCore_INCLUDE_DIR}")
  set(HoloPlayCore_LIBRARIES "${HoloPlayCore_LIBRARY}")
  mark_as_advanced(HoloPlayCore_INCLUDE_DIR)
  mark_as_advanced(HoloPlayCore_LIBRARY)

  if (NOT TARGET HoloPlayCore::HoloPlayCore)
    add_library(HoloPlayCore::HoloPlayCore UNKNOWN IMPORTED)
    set_target_properties(HoloPlayCore::HoloPlayCore
      PROPERTIES
        IMPORTED_LOCATION "${HoloPlayCore_LIBRARY}"
        INTERFACE_INCLUDE_DIRECTORIES "${HoloPlayCore_INCLUDE_DIR}")
  endif ()
endif ()
