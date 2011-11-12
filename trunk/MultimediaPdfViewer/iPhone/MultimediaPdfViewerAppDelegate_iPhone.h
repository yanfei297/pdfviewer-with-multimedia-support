//
//  MultimediaPdfViewerAppDelegate_iPhone.h
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 11/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import "MultimediaPdfViewerAppDelegate.h"
#import "PDFViewConrtroller_iPhone.h"

@interface MultimediaPdfViewerAppDelegate_iPhone : MultimediaPdfViewerAppDelegate {
	PDFViewConrtroller_iPhone *viewController;
}

@property (nonatomic, retain) IBOutlet PDFViewConrtroller_iPhone *viewController;

@end
