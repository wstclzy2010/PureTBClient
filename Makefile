DEBUG = 0

ARCHS = arm64
#TARGET = iphone:13.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Tieba

Tieba_FILES = Tweak.xm
Tieba_CFLAGS = -fobjc-arc


include $(THEOS_MAKE_PATH)/tweak.mk
