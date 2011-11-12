//
//  MultimediaPdfViewerAppDelegate_iPhone.m
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 11/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import "MultimediaPdfViewerAppDelegate_iPhone.h"

@implementation MultimediaPdfViewerAppDelegate_iPhone
@synthesize viewController;

#pragma mark - Override

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
		//self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
	[self.window addSubview:self.viewController.view];
	return YES;
}

- (void)dealloc {
    [viewController release];
    [super dealloc];
}
@end
