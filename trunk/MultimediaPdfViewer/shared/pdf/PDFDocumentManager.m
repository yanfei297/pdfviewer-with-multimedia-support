//
//  PDFDocumentManager.m
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import "PDFDocumentManager.h"

@implementation PDFDocumentManager

@synthesize document;
@synthesize numberOfPages;
@synthesize password;
@synthesize documentUrl;

- (id)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        // Initialization code here.
		self.documentUrl = url;
		self.document = CGPDFDocumentCreateWithURL((CFURLRef)url);
    }
    
    return self;
}



@end
