//
//  PDFTollBar.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PDFToolBarDelegate <NSObject>

@optional

- (void) didStartSearch;
- (void) didAddTobookmark;

@end

@interface PDFToolBar : UIToolbar{
//	UIButton *search;
//	UIButton *bookmark;
	id<PDFToolBarDelegate> delegate;
}

//@property (nonatomic,retain) UIButton *search;
//@property (nonatomic,retain) UIButton *bookmark;
@property (nonatomic,assign)  id<PDFToolBarDelegate> delegate;

- (id) initWithSearchButtonAndFrame:(CGRect)frame;
- (id) initWithBookmarkButtonAndFrame:(CGRect)frame;

@end


