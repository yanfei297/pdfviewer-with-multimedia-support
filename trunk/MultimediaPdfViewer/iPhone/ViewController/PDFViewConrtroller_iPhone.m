//
//  PDFViewConrtroller.m
//  MultimediaPdfViewer
//
//  Created by Sayan Chatterjee on 12/11/11.
//  Copyright 2011 sayan1886@gmail.com. All rights reserved.
//

#import "PDFViewConrtroller_iPhone.h"
#import "PDFToolBar.h"
#import "UITools.h"
#import "constant.h"

#define PAGE_NUM_LABEL_TEXT_PHONE(x,y) [NSString stringWithFormat:@"%d / %d",(x),(y)]


@implementation PDFViewConrtroller_iPhone

@synthesize upperToolbar;
@synthesize thumbnailScrollView;
@synthesize pdfScroller;
@synthesize bottomToolbarView;
@synthesize pageLabel;
@synthesize pageSlider;
@synthesize pageNumLabel;
@synthesize page;
@synthesize documentId;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	isToolbarVisible = NO;
	
	UITapGestureRecognizer *tapOnScreen = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnScreen:)];
	[tapOnScreen setNumberOfTapsRequired:1];
	[tapOnScreen setNumberOfTouchesRequired:1];
	[self.view addGestureRecognizer:tapOnScreen];
	[tapOnScreen release];
	
	[self prepareToolBar];
	[self prepareBottomToolbar];
		//[self prepareThumbSlider];
}

- (void)viewDidUnload
{
    [self setPdfScroller:nil];
	[self setThumbnailScrollView:nil];
	[self setBottomToolbarView:nil];
	[self setDocumentId:nil];
	self.upperToolbar = nil;
	self.bottomToolbarView = nil;
	self.pageSlider = nil;
	self.pageLabel = nil;
	self.pageNumLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}

- (void)dealloc {
    [pdfScroller release];
	RELEASE_SAFELY(thumbnailScrollView);
	RELEASE_SAFELY(bottomToolbarView);
	RELEASE_SAFELY(documentId);
	RELEASE_SAFELY(upperToolbar);
	RELEASE_SAFELY(bottomToolbarView);
	RELEASE_SAFELY(pageLabel);
	RELEASE_SAFELY(pageNumLabel);
	RELEASE_SAFELY(pageSlider);
    [super dealloc];
}

#pragma mark - UserInterface

- (void) prepareToolBar{
	PDFToolBar *toolBar = [[PDFToolBar alloc] initWithFrame:CGRectMake(0, 0 - TOOLBAR_HEIGHT, 320, 44)];
	toolBar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
	toolBar.autoresizesSubviews = YES;
	[self.view addSubview:toolBar];
	self.upperToolbar = toolBar;
	[toolBar release];
}

- (void) prepareBottomToolbar{
	int paddingSlider = 0;
	UIView	 *aContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.bounds.size.width, BOTTOM_TOOLBAR_HEIGHT)];
	CGFloat thumbSliderToolbarHeight = 44;
	CGFloat thumbSliderViewBorderWidth = 50;
	CGFloat thumbSliderHeight = 10;
	CGFloat thumbSliderOffsetY = aContainerView.frame.size.height-44;
	CGFloat thumbSliderOffsetX = thumbSliderOffsetY + 10;
	
    [aContainerView setBackgroundColor:[UIColor brownColor]];
	[aContainerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin];
	[aContainerView setAutoresizesSubviews:YES];
	[aContainerView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3]];
	
	UIToolbar *aThumbSliderToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, thumbSliderOffsetY, self.view.frame.size.width, thumbSliderToolbarHeight)];
		
	[aThumbSliderToolbar setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
	aThumbSliderToolbar.barStyle = UIBarStyleBlackTranslucent;
		
	[aContainerView addSubview:aThumbSliderToolbar];
	[aThumbSliderToolbar release];
	
	if(IPAD) {
		paddingSlider = 10;
	}
	
    
	UISlider *aSlider = [[UISlider alloc]initWithFrame:CGRectMake(10, thumbSliderOffsetX, 230,thumbSliderHeight)];
	
 		//Page slider.
	[aSlider setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleWidth];
	[aSlider setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]];
	[aSlider setMinimumValue:1.0];
		//[aSlider setMaximumValue:[[self document] numberOfPages]];
	[aSlider setContinuous:YES];
	[aSlider addTarget:self action:@selector(actionPageSliderSlided:) forControlEvents:UIControlEventValueChanged];
	[aSlider addTarget:self action:@selector(actionPageSliderStopped:) forControlEvents:UIControlEventTouchUpInside];
	
	[self setPageSlider:aSlider];
	
	[aContainerView addSubview:aSlider];
	
	[aSlider release];
	
	if(!IPAD) {
		
			// Set the number of page into the toolbar at the right the slider on iPhone.
		UILabel *aLabel = [[UILabel alloc]initWithFrame:CGRectMake((thumbSliderViewBorderWidth/2)+(aContainerView.frame.size.width-thumbSliderViewBorderWidth)-60, thumbSliderOffsetX+6, 75, thumbSliderHeight)];
		[aLabel setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
		aLabel.text = PAGE_NUM_LABEL_TEXT_PHONE([self page],10);//[[self document]numberOfPages]);
		aLabel.textAlignment = UITextAlignmentCenter;
		aLabel.backgroundColor = [UIColor clearColor];
		aLabel.textColor = [UIColor whiteColor];
		aLabel.font = [UIFont boldSystemFontOfSize:10.0];
		[aContainerView addSubview:aLabel];
		self.pageNumLabel = aLabel;
		[aLabel release];
	}
	
	[self.view addSubview:aContainerView];
	
	self.bottomToolbarView = aContainerView;
	
	
	[aContainerView release];
}

-(void) prepareThumbSlider {
	
    ThumbnailScrollView * aThumbScrollView = nil;
    NSString * thumbnailCacheFolderPath = nil;
       
    if(IPAD) {
        aThumbScrollView = [[ThumbnailScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 160)];
        aThumbScrollView.thumbnailSize = CGSizeMake(100, 124);
    } else {
        aThumbScrollView = [[ThumbnailScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 70)];
        aThumbScrollView.thumbnailSize = CGSizeMake(50, 64);
    }
    
    [aThumbScrollView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
	
	
	
    /*
     If there is not an associated documentId use the <APPLICATION_HOME>/tmp
     folder to store the thumbnail. Be sure that the folder is deleted when the 
     documentview controller is loaded with a different document manager. 
     Otherwise, if there's a valid documentId, it tries to reuse the appropriate
     folder in the <APPLICATION_HOME>/Library/Caches a folder that will be kept
     between application launches but will not be backed up by iTunes.
     */
  
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    
    if(documentId) {
        
        thumbnailCacheFolderPath = [[[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"]stringByAppendingPathComponent:documentId]stringByAppendingPathComponent:@"thumbs"];
        
        if([fileManager fileExistsAtPath:thumbnailCacheFolderPath isDirectory:&isDirectory]) {
            
				// If the file exist and is not a directory, destroy it and creat it as a folder.
            
            if(!isDirectory) {
                
                [fileManager removeItemAtPath:thumbnailCacheFolderPath error:NULL];
                [fileManager createDirectoryAtPath:thumbnailCacheFolderPath withIntermediateDirectories:YES attributes:nil error:NULL];
            }
            
        } else {
            
			// Create the folder if it does not exist.
			
            [fileManager createDirectoryAtPath:thumbnailCacheFolderPath withIntermediateDirectories:YES attributes:nil error:NULL];
        }
        
    } else {
        
        thumbnailCacheFolderPath = [NSHomeDirectory() stringByAppendingPathComponent:@"tmp/thumbs"];
        
			// Destroy the item, file or folder doesn't matter, then create the folder.
        
        if([fileManager fileExistsAtPath:thumbnailCacheFolderPath isDirectory:&isDirectory]) {
            
            if(!isDirectory) {
                
					// Remove the file.
                
                [fileManager removeItemAtPath:thumbnailCacheFolderPath error:NULL];
                
            } else {
                
					// Remove the contents of the folder, then the folder.
                
                NSArray * items = [fileManager contentsOfDirectoryAtPath:thumbnailCacheFolderPath error:NULL];
                for (NSString * item in items) {
                    [fileManager removeItemAtPath:item error:NULL];
                }
                
                [fileManager removeItemAtPath:thumbnailCacheFolderPath error:NULL];
                
            }
        } 
        
			// (Re)create the folder.
        
        [fileManager createDirectoryAtPath:thumbnailCacheFolderPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
		// Setting stuff.
	
    [aThumbScrollView setCacheFolderPath:thumbnailCacheFolderPath];
	[aThumbScrollView setPagesCount:10];//[self.document numberOfPages]];
    [aThumbScrollView setDelegate:self];
    
		// Put the thumb scrollview inside the bottom view initialized in viewDidLoad.
    
    self.thumbnailScrollView = aThumbScrollView;
	[bottomToolbarView addSubview:aThumbScrollView];
		// Cleanup.
    
	[aThumbScrollView release];
  
	//[self.view addSubview:[UITools createLabelWithFrame:CGRectMake(0, 360, 320, 100) LabelText:@"TEST"]];
}

#pragma mark - Actions

-(void) actionPageSliderSlided:(id)sender {
	
		// When the user move the slider, we update the label.
	
		// Get the slider value.
	UISlider *slider = (UISlider *)sender;
	NSNumber *number = [NSNumber numberWithFloat:[slider value]];
	NSUInteger pageNumber = [number unsignedIntValue];
	
		// Update the label.
    
	[pageNumLabel setText:PAGE_NUM_LABEL_TEXT_PHONE(pageNumber,10)];//[[self document]numberOfPages])];
	
}

-(void) actionPageSliderStopped:(id)sender {
	
		// Get the requested page number from the slider.
	UISlider *slider = (UISlider *)sender;
	NSNumber *number = [NSNumber numberWithFloat:[slider value]];
	NSUInteger pageNumber = [number unsignedIntValue];
	
		// Go to the page.
	[self setPage:pageNumber];
    
    
}

- (void) tapOnScreen:(UITapGestureRecognizer *)tap{
	if (tap.state == UIGestureRecognizerStateEnded) {
		if (!isToolbarVisible) {
			[self showToolbar];
			isToolbarVisible = YES;
		}
		else{
			[self hideToolbar];
			isToolbarVisible = NO;
		}
	}
}

#pragma mark - Animation

-(void) showToolbar{
	[UIView animateWithDuration:1.0 animations:^{
		upperToolbar.frame = CGRectMake(0, 0, 320, TOOLBAR_HEIGHT); 
		bottomToolbarView.frame =CGRectMake(0, self.view.frame.size.height - BOTTOM_TOOLBAR_HEIGHT, self.view.bounds.size.width, BOTTOM_TOOLBAR_HEIGHT);
	}];
}

- (void)hideToolbar{
	[UIView animateWithDuration:1.0 animations:^{
		upperToolbar.frame = CGRectMake(0, 0 - TOOLBAR_HEIGHT, 320, TOOLBAR_HEIGHT); 
		bottomToolbarView.frame =CGRectMake(0, self.view.frame.size.height, self.view.bounds.size.width, BOTTOM_TOOLBAR_HEIGHT);
	}];
}

#pragma mark - ThumbnailScrollViewDelegate methods

-(void)thumbnailScrollView:(ThumbnailScrollView *)scrollView didSelectPage:(NSUInteger)page_ {
	[self setPage:page_];
}


@end
