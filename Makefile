TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e
SYSROOT = $(THEOS)/sdks/iPhoneOS14.2.sdk
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Unveil

Unveil_FILES = Unveil.m
Unveil_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
