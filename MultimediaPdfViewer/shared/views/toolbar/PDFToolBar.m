//
//  PDFTollBar.m
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import "PDFToolBar.h"
#import "UITools.h"

@implementation PDFToolBar

//@synthesize search;
//@synthesize bookmark;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		self.barStyle = UIBarStyleBlackTranslucent;
		self.frame = frame;
			
		UIBarButtonItem *search = [[UIBarButtonItem alloc] initWithCustomView:[UITools createButtonWithFrame:CGRectMake(10, 10, 30, 30) ButtonType:UIButtonTypeCustom buttonText:@"" target:self action:@selector(startSearch:) normalStateImage:[UIImage imageNamed:@"search_phone.png"] highlightedStateImage:nil hasTag:1]];
		
		UIBarButtonItem *bookMark = [[UIBarButtonItem alloc] initWithCustomView:[UITools createButtonWithFrame:CGRectMake(50, 10, 30, 30) ButtonType:UIButtonTypeCustom buttonText:@"" target:self action:@selector(addToBookMark:) normalStateImage:[UIImage imageNamed:@"bookmark_add_phone.png"] highlightedStateImage:nil hasTag:2]];
		NSArray *toolBarItems = [NSArray arrayWithObjects:search,bookMark,nil];
		[self setItems:toolBarItems animated:YES];
		[search release];
		[bookMark release];
		
	}
    
    return self;
}

- (id) initWithSearchButtonAndFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
    if (self) {
			// Initialization code here.
		self.barStyle = UIBarStyleBlackTranslucent;
		self.frame = frame;
		UIBarButtonItem *search = [[UIBarButtonItem alloc] initWithCustomView:[UITools createButtonWithFrame:CGRectMake(10, 10, 30, 30) ButtonType:UIButtonTypeCustom buttonText:@"" target:self action:@selector(startSearch:) normalStateImage:[UIImage imageNamed:@"search_phone.png"] highlightedStateImage:nil hasTag:1]];
		NSArray *toolBarItems = [NSArray arrayWithObjects:search,nil];
		[self setItems:toolBarItems animated:YES];
		[search release];
    }
    
    return self;
}

- (id) initWithBookmarkButtonAndFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
    if (self) {
			// Initialization code here.
		self.barStyle = UIBarStyleBlackTranslucent;
		self.frame = frame;
		UIBarButtonItem *bookMark = [[UIBarButtonItem alloc] initWithCustomView:[UITools createButtonWithFrame:CGRectMake(50, 10, 30, 30) ButtonType:UIButtonTypeCustom buttonText:@"" target:self action:@selector(addToBookMark:) normalStateImage:[UIImage imageNamed:@"bookmark_add_phone.png"] highlightedStateImage:nil hasTag:2]];
		NSArray *toolBarItems = [NSArray arrayWithObjects:bookMark,nil];
		[self setItems:toolBarItems animated:YES];
		[bookMark release];
    }
    
    return self;
}

#pragma mark - UIButtonActions

- (void) startSearch:(id)sender{
	if (self.delegate) {
		if ([self.delegate respondsToSelector:@selector(didStartSearch)]) {
			[self.delegate didStartSearch];
		}
	}
}

- (void) addToBookMark:(id)sender{
	if (self.delegate) {
		if ([self.delegate respondsToSelector:@selector(didAddTobookmark)]) {
			[self.delegate didAddTobookmark];
		}
	}
}

#pragma mark - memoryManagement

- (void)dealloc{
	self.delegate =nil;
	[super dealloc];
}

@end
