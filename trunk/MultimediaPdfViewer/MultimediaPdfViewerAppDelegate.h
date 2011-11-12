//
//  MultimediaPdfViewerAppDelegate.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 11/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultimediaPdfViewerAppDelegate : NSObject <UIApplicationDelegate>{
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) 	UINavigationController *navigationController;

@end
