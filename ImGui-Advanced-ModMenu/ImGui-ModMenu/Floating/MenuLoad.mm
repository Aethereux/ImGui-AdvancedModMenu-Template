/*
IOS Theos Template Komaru
Jailed (NoJB) Mod Menu Template for iOS Games
By aq9
https://github.com/VenerableCode/iOS-Theos-ModMenuTemp-NoJB
*/


#import <UIKit/UIKit.h>
#import "MenuLoad.h"
#include "../include.h"
#include "logo.h"

@interface MenuLoad()

@property (nonatomic, strong) ImGuiDrawView *vna;

- (ImGuiDrawView*) GetImGuiView;

@end

static MenuLoad* extraInfo = nil;

UIButton* InvisibleMenuButton;
UIButton* VisibleMenuButton;
MenuInteraction* menuTouchView;
UITextField* hideRecordTextfield;
UIView* hideRecordView;
ImFont* Font;
ImVec2 MenuSize   = ImVec2(0, 0);
ImVec2 MenuOrigin = ImVec2(0, 0);

@interface MenuInteraction()

@end

@implementation MenuInteraction

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect touchableArea = CGRectMake(MenuOrigin.x, MenuOrigin.y, MenuSize.x, MenuSize.y);
    if (CGRectContainsPoint(touchableArea, point)) {
        return [super pointInside:point withEvent:event];
    }
    return NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[extraInfo GetImGuiView] updateIOWithTouchEvent:event];
}

@end

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[MenuLoad getInstance] initTapGes];
    });
}

__attribute__((constructor)) static void initialize() {
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDrop);
}


@implementation MenuLoad

bool isOpened = false;

- (ImGuiDrawView*) GetImGuiView {
    return _vna;
}

- (instancetype)init
{
    if (self = [super init]) {

    }
    return self;
}

MenuLoad* getInstanceCpp() {
    static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            extraInfo = [[MenuLoad alloc] init];
        });
        return extraInfo;
}

+ (MenuLoad*)getInstance {
    return getInstanceCpp();
}


float iconScale = isIpad ? 50.0f : 45.0f;
-(void)initTapGes {

    UIView* mainView = [UIApplication sharedApplication].windows[0].rootViewController.view;

    hideRecordTextfield = [[UITextField alloc] init];
    hideRecordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height)];
    [hideRecordView setBackgroundColor:[UIColor clearColor]];
    [hideRecordView setUserInteractionEnabled:YES];
    hideRecordTextfield.secureTextEntry = true;
    [hideRecordView addSubview:hideRecordTextfield];
    CALayer *layer = hideRecordTextfield.layer;
    
    if ([layer.sublayers.firstObject.delegate isKindOfClass:[UIView class]]) {
        hideRecordView = (UIView *)layer.sublayers.firstObject.delegate;
    } else {
        hideRecordView = nil;
    }

    [[UIApplication sharedApplication].keyWindow addSubview:hideRecordView];

    if (!_vna) {
        ImGuiDrawView *vc = [[ImGuiDrawView alloc] init];
        _vna = vc;
    }
    
    [ImGuiDrawView showChange:false];
    [hideRecordView addSubview:_vna.view];

    menuTouchView = [[MenuInteraction alloc] initWithFrame:mainView.frame];
    [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:menuTouchView];

    NSData* data = [[NSData alloc] initWithBase64EncodedString:image64 options:0];
    UIImage* menuIconImage = [UIImage imageWithData:data];

    InvisibleMenuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    InvisibleMenuButton.frame = CGRectMake(90, 90, iconScale, iconScale);
    InvisibleMenuButton.backgroundColor = [UIColor clearColor];
    [InvisibleMenuButton addTarget:self action:@selector(buttonDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showMenu:)];
    [InvisibleMenuButton addGestureRecognizer:tapGestureRecognizer];
    [[UIApplication sharedApplication].windows[0].rootViewController.view addSubview:InvisibleMenuButton];
    
    VisibleMenuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    VisibleMenuButton.frame = CGRectMake(90, 90, iconScale, iconScale);
    VisibleMenuButton.backgroundColor = [UIColor clearColor];
    VisibleMenuButton.layer.cornerRadius = VisibleMenuButton.frame.size.width * 0.5f;
    [VisibleMenuButton setBackgroundImage:menuIconImage forState:UIControlStateNormal];
    [hideRecordView addSubview:VisibleMenuButton];
}

-(void)showMenu:(UITapGestureRecognizer *)tapGestureRecognizer {
    if(tapGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [ImGuiDrawView showChange:![ImGuiDrawView isMenuShowing]];
    }
}

- (void)buttonDragged:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event touchesForView:button] anyObject];

    CGPoint previousLocation = [touch previousLocationInView:button];
    CGPoint location = [touch locationInView:button];
    CGFloat delta_x = location.x - previousLocation.x;
    CGFloat delta_y = location.y - previousLocation.y;

    button.center = CGPointMake(button.center.x + delta_x, button.center.y + delta_y);
    
    CGRect mainFrame = [UIApplication sharedApplication].windows[0].rootViewController.view.bounds;
    if(button.center.x < 0) button.center = CGPointMake(0,button.center.y);
    if(button.center.y < 0) button.center = CGPointMake(button.center.x,0);
    if(button.center.y > mainFrame.size.height) button.center = CGPointMake(button.center.x,mainFrame.size.height);
    if(button.center.x > mainFrame.size.width) button.center = CGPointMake(mainFrame.size.width,button.center.y);
    
    VisibleMenuButton.center = button.center;
    VisibleMenuButton.frame = button.frame;
}

@end
