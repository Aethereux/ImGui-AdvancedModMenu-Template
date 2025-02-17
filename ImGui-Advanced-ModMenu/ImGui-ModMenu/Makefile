ARCHS = arm64 #arm64e
DEBUG = 0
FINALPACKAGE = 1
FOR_RELEASE = 1

TARGET := iphone:clang:latest:latest
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ImGui-ModMenu
$(TWEAK_NAME)_USE_MODULES = 0

MenuFiles = $(wildcard Menu/*.mm)
utilsFiles = $(wildcard util/*.cpp)
ImGuiFiles =  $(wildcard IMGUI/*.cpp) \
              $(wildcard IMGUI/*.mm) 
FloatingFiles = $(wildcard Floating/*.mm) \
                $(wildcard Floating/Utils/*.cpp)


$(TWEAK_NAME)_FILES = $(MenuFiles) $(utilsFiles) $(ImGuiFiles) $(FloatingFiles)

$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation Security QuartzCore CoreGraphics CoreText AVFoundation Accelerate GLKit SystemConfiguration GameController ImageIO CoreFoundation CFNetwork ReplayKit


$(TWEAK_NAME)_CCFLAGS = -std=c++20 -fno-rtti -DNDEBUG -Wno-unused-variable -O0 -Wno-error -fobjc-arc -Wno-unused-property-ivar -Wno-format


$(TWEAK_NAME)_LDFLAGS += -framework Metal -framework MetalKit

$(TWEAK_NAME)_CFLAGS =-fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-writable-strings -O0 -Wno-unused-property-ivar -Wno-format


export LDFLAGS += -Wl,-S

# Uncomment if you need to include libraries
#TESTGAY_LIBRARIES = c++ xml2
# GO_EASY_ON_ME = 1

include $(THEOS_MAKE_PATH)/tweak.mk

 
