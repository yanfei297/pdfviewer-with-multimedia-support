//
//  PDFViewConrtroller.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThumbnailScrollView.h"
@class PDFToolBar;

@interface PDFViewConrtroller_iPhone : UIViewController<ThumbnailScrollViewDelegate> {
	BOOL isToolbarVisible;
	
	UIScrollView *pdfScroller;
	PDFToolBar *upperToolbar;
	ThumbnailScrollView * thumbnailScrollView;
	UIView * bottomToolbarView;
	
	UILabel * pageLabel;    // Page label at the bottom of the screen.
	UISlider * pageSlider;  // Page slider at the bottom of the screen.
	UILabel * pageNumLabel;
	NSUInteger page;
	NSString * documentId;  // Keep an unique reference to the document in the application (could be an ID, the name, etc).
}

@property (nonatomic,retain) PDFToolBar *upperToolbar;
@property (nonatomic, retain) IBOutlet UIScrollView *pdfScroller;
@property (nonatomic,retain)  ThumbnailScrollView * thumbnailScrollView;
@property (nonatomic,retain) UIView * bottomToolbarView;
@property (nonatomic,retain) UILabel * pageLabel;
@property (nonatomic,retain) UISlider * pageSlider;
@property (nonatomic,retain) UILabel * pageNumLabel;
@property (nonatomic,assign) NSUInteger page;
@property (nonatomic,retain) NSString * documentId;

-(void)prepareToolBar;
- (void) prepareBottomToolbar;
-(void)prepareThumbSlider;
-(void) showToolbar;
-(void) hideToolbar;

@end
