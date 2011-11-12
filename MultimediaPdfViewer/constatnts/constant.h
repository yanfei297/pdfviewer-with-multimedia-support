//
//  constant.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
 

//check for ios version
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define SYSTEM_VERSION _LESS_THAN_4_2 (SYSTEM_VERSION_LESS_THAN(@"4.2") )

//check the device idiom

#define IPAD		([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)

//check for orientation 
#define DEVICE_ORIENTATION_LANDSCAPE  ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)

//check for new state
// #define ISNEWSTATELOADED ([UserSettings isNewStateSelected])

// A Log always displays output regardless of the UADEBUG setting
#define BG_BLog(fmt, ...) \
do { \
if (1) { \
NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); \
} \
} while(0)

#define BGLOG BG_BLog

//release a pointer

#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

// constant for tollbar height

#define TOOLBAR_HEIGHT 44

#define BOTTOM_TOOLBAR_HEIGHT_PAD 204
#define BOTTOM_TOOLBAR_HEIGHT 114

#define THUMBSIZE_PHONE CGSizeMake(50, 64);
#define THUMBSIZE_PAD CGSizeMake(100, 124);


