//
//  ThumbnailView.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ThumbnailScrollView;

@interface ThumbnailView : UIView {
    
    UIActivityIndicatorView * activityIndicator;
    
    NSInteger position;
    
    UILabel * pageNumberLabel;
    NSNumber * pageNumber;
    
    UIImageView * thumbnailView;
    NSString * thumbnailImagePath;
    
    UIImage * thumbnailImage;
    
    ThumbnailScrollView * delegate;
}

@property (nonatomic,retain) NSNumber * pageNumber;
@property (nonatomic,retain) UILabel * pageNumberLabel;

@property (nonatomic,retain) UIImageView * thumbnailView;
@property (nonatomic,copy) NSString *thumbnailImagePath;

@property (nonatomic,retain) UIActivityIndicatorView * activityIndicator;

@property (nonatomic,assign) ThumbnailScrollView * delegate;

@property (nonatomic,readwrite) NSInteger position;

@property (nonatomic,retain) UIImage * thumbnailImage;

-(void)reloadImage:(UIImage *)image;

@end
