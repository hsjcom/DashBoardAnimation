//
//  Constant.h
//  Extension
//
//  Created by Soldier on 2016/12/15.
//  Copyright © 2016年 Shaojie Hong. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define AppDelegateInstance [[UIApplication sharedApplication] delegate]
#define TopView    [AppDelegateInstance window].rootViewController.view
#define KeyWindow  [AppDelegateInstance window]

#define UI_SCREEN_BOUNDS ([[UIScreen mainScreen] bounds])
#define UI_SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define StatusBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height)
#define OSVersion()  [[[UIDevice currentDevice] systemVersion] floatValue]
#define Bunndle_AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define Isios10() (HBOSVersion() >= 10.0)
#define Isios9() (HBOSVersion() >= 9.0)
#define Isios8() (HBOSVersion() >= 8.0)
#define Isios7() (HBOSVersion() >= 7.0)
#define Isipad() (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsNotipad() (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)

#define RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define DegreesToRadians(x) ((x) * M_PI / 180.0)

#define INVALIDATE_TIMER(__TIMER) { [__TIMER invalidate]; __TIMER = nil; }
#define RELEASE_DISPATCH_SOURCE(__POINTER) {dispatch_source_cancel(__POINTER); _dispatch_object_validate(__POINTER); __POINTER = nil;}
#define RELEASE_SAFELY(__POINTER) {__POINTER = nil;}
#define RELEASE_VIEW_SAFELY(__POINTER) {[__POINTER removeFromSuperview]; __POINTER = nil; }
#define RELEASE_LAYER_SAFELY(__POINTER) {[__POINTER removeFromSuperlayer]; __POINTER = nil; }

#define WeakSelf(weakSelf) __weak typeof (self) weakSelf = self;
#define StrongSelf(strongSelf, weakSelf) __strong typeof(weakSelf) strongSelf = weakSelf;


#define COLOR_C1 RGBCOLOR(255, 211, 33)  //yellow
#define COLOR_C2 RGBCOLOR(228, 191, 88)
#define COLOR_C3 RGBCOLOR(40, 33, 33)
#define COLOR_C4 RGBCOLOR(255, 68, 86)  //red
#define COLOR_G1 RGBCOLOR(53, 53, 53)
#define COLOR_G2 RGBCOLOR(115, 115, 115)
#define COLOR_G3 RGBCOLOR(163, 163, 163)
#define COLOR_G4 RGBCOLOR(211, 210, 210)
#define COLOR_BG RGBCOLOR(246, 246, 246)

#endif /* Constant_h */
