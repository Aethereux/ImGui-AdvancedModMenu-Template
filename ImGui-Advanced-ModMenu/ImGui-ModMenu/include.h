//
//  include.h
//  ImGui-Advanced-ModMenu
//
//  Created by Euclid Jan Guillermo on 2/17/25.
//

#ifndef include_h
#define include_h

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
// Imgui library
#import "Floating/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_impl_metal.h"
#import "IMGUI/imgui_internal.h"
#import "Floating/MenuLoad.h"

#include "menu/Menu.hpp"

#include <string>
#include <codecvt>
#include <locale>
#import <os/log.h>
#import <dlfcn.h>
#include <vector>
#include <map>
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>
#include <vector>
#include <array>
#include <thread>
#include <chrono>
#include <functional>
#include <iostream>
#include <unordered_set>
#include <sstream>
#include <algorithm>  // Include for std::min
#import <mach-o/dyld.h>
#import <mach-o/getsect.h>
#include <sys/stat.h>
#include <fstream>
#include <shared_mutex>


#define RadiansToDegree  180 / 3.141592654f;
#define DegreeToRadians 3.141592654f / 180
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SCALE [UIScreen mainScreen].scale
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
#define PI 3.14159265

#define isIpad UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad
#define isIphone (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone)

extern MenuInteraction* menuTouchView;
extern UIButton* InvisibleMenuButton;
extern UIButton* VisibleMenuButton;
extern UITextField* hideRecordTextfield;
extern UIView* hideRecordView;
extern ImFont* Font;
extern ImVec2 MenuSize;
extern ImVec2 MenuOrigin;

extern bool StreamerMode;


#endif /* include_h */
