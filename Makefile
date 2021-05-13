#Only use if using Xcode 12+
#PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
PREFIX=$(THEOS)/toolchain/Xcode11.xctoolchain/usr/bin/


export ARCHS = arm64 arm64e
TARGET = iphone:14.4:13.0
INSTALL_TARGET_PROCESSES = YouTube

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iSponsorBlock

iSponsorBlock_FILES = iSponsorBlock.xm $(wildcard *.m)
iSponsorBlock_LIBRARIES = colorpicker
iSponsorBlock_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
iSponsorBlock_FRAMEWORKS = UIKit CoreGraphics AVFoundation CoreMedia QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

# https://stackoverflow.com/questions/15999757/how-to-include-resource-files-in-theos-makefile (Steps 1-3)
# your_bundle_identifier_INSTALL_PATH did not work for me instead the resources bundle was installed in the target main bundle. My guess is INSTALL_TARGET_PROCESSES supersedes your_bundle_identifier_INSTALL_PATH

BUNDLE_NAME = com.galacticdev.isponsorblock
include $(THEOS)/makefiles/bundle.mk
