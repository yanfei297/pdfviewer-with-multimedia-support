//
//  PDFDocumentManager.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface PDFDocumentManager : NSObject{
	CGPDFDocumentRef document;
	NSString *password;
	NSUInteger numberOfPages;
	NSURL *documentUrl;
}

@property (nonatomic,assign) CGPDFDocumentRef document;
@property (nonatomic,retain) NSString *password;
@property (nonatomic,retain) NSURL *documentUrl;
@property (nonatomic,assign) NSUInteger numberOfPages;

- (id)initWithURL:(NSURL *)url;

@end
