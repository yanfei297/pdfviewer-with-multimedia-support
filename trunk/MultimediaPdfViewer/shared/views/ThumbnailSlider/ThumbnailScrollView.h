//
//  ThumbnailView.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
	//#import "MFDocumentManager.h"

@class ThumbnailView;
@class ThumbnailScrollView;

@protocol ThumbnailScrollViewDelegate

-(void)thumbnailScrollView:(ThumbnailScrollView *)scrollView didSelectPage:(NSUInteger)page;

@end

@interface ThumbnailScrollView : UIView <UIScrollViewDelegate> {
    
    NSUInteger thumbnailCount;
    
    NSUInteger page;
    NSUInteger pagesCount;
    
    NSArray * thumbnailViews;
    
    NSUInteger currentThumbnailPosition;
    
    CGSize thumbnailSize;
    CGFloat padding;
    
    id<ThumbnailScrollViewDelegate> delegate;
    
    BOOL backgroundWorkStillGoingOn;
    BOOL shouldContinueBackgrounWork;
    
    
    NSString * cacheFolderPath;
}

@property (nonatomic,readwrite) NSUInteger pagesCount;

@property (nonatomic,readwrite) CGSize thumbnailSize;
@property (nonatomic,readwrite) CGFloat padding;

@property (nonatomic,assign) id<ThumbnailScrollViewDelegate> delegate;
@property (nonatomic, copy) NSString * cacheFolderPath;

int nextOffset(int offset);
CGFloat thumbnailOffset(int position, CGFloat thumbWidth, CGFloat padding, CGFloat viewportWidth);
CGFloat contentWidth (CGFloat thumbWidth, CGFloat padding, int count, CGFloat viewportWidth);
CGFloat contentOffset(int position, CGFloat thumbWidth, CGFloat padding, CGFloat viewportWidth);
BOOL isViewOutsideRange(int viewPosition, int currentPosition, int count);
int numberOfThumbnails(CGFloat viewportWidth, CGFloat thumbWidth, CGFloat padding);

-(void)setPage:(NSUInteger)page animated:(BOOL)animated;
-(NSUInteger)page;
-(void)start;
-(void)stop;
-(void)thumbTapped:(NSInteger)position withObject:(id)obj ;

@end
