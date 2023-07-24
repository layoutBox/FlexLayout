#!/bin/bash

FRAMEWORK_NAME="FlexLayout"
BUILD_DIRECTORY="Build"
DEVICE_ARCHIVE_DIRECTORY="$BUILD_DIRECTORY/device.xcarchive"
SIMULATOR_ARCHIVE_DIRECTORY="$BUILD_DIRECTORY/simulator.xcarchive"
XCFRAMEWORK_PATH="$BUILD_DIRECTORY/$FRAMEWORK_NAME.xcframework"

if [ ! -d "$BUILD_DIRECTORY" ]; then
  mkdir $BUILD_DIRECTORY
fi

# Archive
xcodebuild archive\
  -scheme "FlexLayout"\
  -destination="device"\
  -sdk iphoneos\
  -archivePath "$DEVICE_ARCHIVE_DIRECTORY"\
  SKIP_INSTALL=NO\
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive\
    -scheme "FlexLayout"\
    -destination="simulator"\
    -sdk iphonesimulator\
    -archivePath "$SIMULATOR_ARCHIVE_DIRECTORY"\
    SKIP_INSTALL=NO\
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES
    
xcodebuild -create-xcframework\
    -framework "$DEVICE_ARCHIVE_DIRECTORY/Products/Library/Frameworks/$FRAMEWORK_NAME.framework"\
    -framework "$SIMULATOR_ARCHIVE_DIRECTORY/Products/Library/Frameworks/$FRAMEWORK_NAME.framework"\
    -output "$XCFRAMEWORK_PATH"
    
# Compress
zip -r -X "$XCFRAMEWORK_PATH.zip" "$XCFRAMEWORK_PATH/"

# Save the checksum
swift package compute-checksum "$XCFRAMEWORK_PATH.zip" >> $BUILD_DIRECTORY/checksum

# Clean up
rm -r $BUILD_DIRECTORY/*.xcframework
rm -r $BUILD_DIRECTORY/*.xcarchive
