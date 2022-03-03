ARCHS = arm64 arm64e
TARGET = iphone:14.5:13.0
INSTALL_TARGET_PROCESSES = YouTube
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iSponsorBlock

iSponsorBlock_FILES = iSponsorBlock.xm $(wildcard *.m)
iSponsorBlock_LIBRARIES = colorpicker
iSponsorBlock_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
iSponsorBlock_FRAMEWORKS = UIKit CoreGraphics AVFoundation CoreMedia QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
