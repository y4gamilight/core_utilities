#!/bin/bash

xcodebuild archive \
-scheme SampleFramwork \
-configuration Release \
-destination 'generic/platform=iOS' \
-archivePath './build/SampleFramwork.framework-iphoneos.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme SampleFramwork \
-configuration Release \
-destination 'generic/platform=iOS Simulator' \
-archivePath './build/SampleFramwork.framework-iphonesimulator.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme SampleFramwork \
-configuration Release \
-destination 'platform=macOS,arch=x86_64,variant=Mac Catalyst' \
-archivePath './build/SampleFramwork.framework-catalyst.xcarchive' \
SKIP_INSTALL=NO \
BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
-framework './build/SampleFramwork.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/SampleFramwork.framework' \
-framework './build/SampleFramwork.framework-iphoneos.xcarchive/Products/Library/Frameworks/SampleFramwork.framework' \
-framework './build/SampleFramwork.framework-catalyst.xcarchive/Products/Library/Frameworks/SampleFramwork.framework' \
-output './build/SampleFramwork.xcframework'