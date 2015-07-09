/*
 This module is licensed under the MIT license.
 
 Copyright (C) 2015 Baltazar C. Lucas
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */


#import "WallViewController.h"
#import "TitleAndTextView.h"
#import "Layout1.h"

#import "SharedHelper.h"
#import "UIViewExtention.h"
#import "AFKPageFlipper.h"
#import "FullScreenView.h"
#import "FooterView.h"
#import "HeaderView.h"
#import "Feeds.h"
#import "MessageModel.h"
#import "PageModel.h"

@implementation WallViewController

@synthesize arrayViewControler,gestureRecognizer,wallTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    DLog();
    if ( self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		[self.view setBackgroundColor:[UIColor whiteColor]];
        self.view.autoresizesSubviews = YES;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
		isInFullScreenMode = FALSE;
		
        pages = [Feeds generateSampleFeeds];
		
        arrayViewControler = [[NSMutableArray alloc] init];
        
        int totalMessageCount = (int)[pages count];
        
        for (int i=1; i<=totalMessageCount; i++) {
            [arrayViewControler addObject:[NSString stringWithFormat:@"%d",i]];
        }
		
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
            flipper = [[AFKPageFlipper alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
        }else {
            flipper = [[AFKPageFlipper alloc] initWithFrame:self.view.bounds];
        }
		flipper.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		flipper.dataSource = self;
		[self.view addSubview:flipper];
		
    }
    return self;
}

-(void)showViewInFullScreen:(UIViewExtention*)viewToShow withModel:(MessageModel*)model{
    DLog();
    if (!isInFullScreenMode) {
        isInFullScreenMode = TRUE;
        
        CGRect bounds = [UIScreen mainScreen].bounds;
        
        fullScreenBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, bounds.size.height)];
        fullScreenBGView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [fullScreenBGView setBackgroundColor:RGBACOLOR(0,0,0,0.6)];
        fullScreenBGView.alpha = 0;
        
        [self.view addSubview:fullScreenBGView];
        
        viewToShowInFullScreen =  viewToShow;
        viewToShowInFullScreen.originalRect = viewToShowInFullScreen.frame;
        viewToShowInFullScreen.isFullScreen = TRUE;
        FullScreenView* fullView = [[FullScreenView alloc] initWithModel:model];
        fullView.frame = viewToShowInFullScreen.frame;
        fullView.viewToOverLap = viewToShowInFullScreen;
        fullView.fullScreenBG = fullScreenBGView;
        fullScreenView = fullView;
        
        [self.view addSubview:fullView];
        [self.view bringSubviewToFront:fullScreenBGView];
        [self.view bringSubviewToFront:fullView];
        
        [UIView beginAnimations:@"SHOWFULLSCREEN" context:NULL];
        [UIView setAnimationDuration:0.40];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:nil cache:NO];
        fullScreenBGView.alpha = 1;
        
        if ([SharedHelper GetScreenOrientation] == UIInterfaceOrientationPortrait ||
            [SharedHelper GetScreenOrientation] == UIInterfaceOrientationPortraitUpsideDown) {
            [fullView setFrame:CGRectMake(10, 50, 768-20, 1004-60)];
        } else {
            [fullView setFrame:CGRectMake(10, 50, 1024-20, 746-60)];
        }
        
        [fullScreenView rotate:[SharedHelper GetScreenOrientation] animation:YES];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationEnd:finished:context:)];
        [UIView commitAnimations];
    }
}

-(void)closeFullScreen {
    DLog();
    if (fullScreenView != nil) {
        fullScreenBGView.alpha = 0;
        [fullScreenBGView removeFromSuperview];
        
        fullScreenView.alpha = 0;
        [fullScreenView removeFromSuperview];
        fullScreenView = nil;
        isInFullScreenMode = FALSE;
    }
}

-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    DLog();
    if (fullScreenView != nil) {
        [UIView beginAnimations:@"WILLROTATE" context:NULL];
        [UIView setAnimationDuration:0.50];
        [UIView setAnimationCurve:UIViewAnimationOptionCurveEaseInOut];
        
        if (toInterfaceOrientation == UIInterfaceOrientationPortrait ||
            toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
            [fullScreenView setFrame:CGRectMake(10, 50, 768-20, 1004-60)];
        }else {
            [fullScreenView setFrame:CGRectMake(10, 50, 1024-20, 748-60)];
        }
        [fullScreenView rotate:toInterfaceOrientation animation:YES];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationEnd:finished:context:)];
        [UIView commitAnimations];
    }
    
    
    if ([arrayViewControler count] > 0 && [flipper.subviews count] > 0) {
        
        for (UIView* subview in flipper.subviews) {
            if ([subview isKindOfClass:[LayoutViewExtention class]]) {
                LayoutViewExtention* layoutView = (LayoutViewExtention*)subview;
                [layoutView rotate:toInterfaceOrientation animation:YES];
                layoutView.footerView.alpha = 0;
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.50];
                if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
                    [layoutView.footerView setFrame:CGRectMake(0, 1004 - 20, 768, layoutView.footerView.frame.size.height)];
                }else {
                    [layoutView.footerView setFrame:CGRectMake(0, 748 - 20, 1024, layoutView.footerView.frame.size.height)];
                }
                [layoutView.footerView rotate:toInterfaceOrientation animation:YES];
//                [layoutView.headerView rotate:toInterfaceOrientation animation:YES];
                [UIView commitAnimations];
            }
            
        }
    }
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    DLog();
    if ([arrayViewControler count] > 0 && [flipper.subviews count] > 0) {
        for (UIView* subview in flipper.subviews) {
            if ([subview isKindOfClass:[LayoutViewExtention class]]) {
                LayoutViewExtention* layoutView = (LayoutViewExtention*)subview;
                layoutView.footerView.alpha = 1;
            }
        }
    }
}

- (void)animationEnd:(NSString*)animationID finished:(NSNumber*)finished context:(UIView*)context {
    DLog();
    if ([animationID isEqualToString:@"WILLROTATE"]) {
        if (fullScreenView != nil) {
            [fullScreenView setBackgroundColor:RGBACOLOR(0,0,0,0.6)];
        }		
    }else if ([animationID isEqualToString:@"FOOTER"]) {
        if (context) {
            ((UIView*)context).alpha = 1;
        }
    }else if ([animationID isEqualToString:@"SHOWFULLSCREEN"]) {
        [fullScreenView showFields];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    DLog();
    if (flipper) {
        return !flipper.animating;
    }
    
    return YES;
}

- (void)dealloc {
    DLog();
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark -
#pragma mark Data source implementation

- (NSInteger) numberOfPagesForPageFlipper:(AFKPageFlipper *)pageFlipper {
    DLog();
	return [arrayViewControler count];
}

- (UIView *) viewForPage:(NSInteger) page inFlipper:(AFKPageFlipper *) pageFlipper {
    DLog(@"Page %d", page);
  	LayoutViewExtention* layoutToReturn = nil;

    PageModel *pageModel = [pages objectAtIndex:page-1];
    
    Class class =  NSClassFromString(pageModel.layoutNumber);
    id layoutObject = [[class alloc] init];
    
    if ([layoutObject isKindOfClass:[LayoutViewExtention class]] ) {
        
        layoutToReturn = (LayoutViewExtention*)layoutObject;

        NSMutableDictionary* viewDictonary = [[NSMutableDictionary alloc] init];
        for (int i=0; i < pageModel.messages.count; i++) {
            MessageModel *message = [pageModel.messages objectAtIndex:i];
            TitleAndTextView* view1forLayout = [[TitleAndTextView alloc] initWithMessageModel:(MessageModel*)message];
            [viewDictonary setObject:view1forLayout forKey:[NSString stringWithFormat:@"view%d", i+1]];
        }
        
        [layoutToReturn initalizeViews:viewDictonary];
        [layoutToReturn rotate:[SharedHelper GetScreenOrientation] animation:NO];
        [layoutToReturn setFrame:self.view.bounds];
        layoutToReturn.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        HeaderView* headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, layoutToReturn.frame.size.width, 50)];
        headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [headerView setWallTitleText:pageModel.headerTitle];
        [headerView setBackgroundColor:[UIColor whiteColor]];
//        [headerView rotate:[SharedHelper GetScreenOrientation] animation:NO];
        [layoutToReturn setHeaderView:headerView];
        
        FooterView* footerView = [[FooterView alloc] initWithFrame:CGRectMake(0, layoutToReturn.frame.size.height - 20, layoutToReturn.frame.size.width, 20)];
        [footerView setBackgroundColor:[UIColor whiteColor]];
        [footerView setFlipperView:flipper];
        [footerView setViewArray:arrayViewControler];
        
        if ([SharedHelper GetScreenOrientation] == UIInterfaceOrientationPortrait ||
            [SharedHelper GetScreenOrientation] == UIInterfaceOrientationPortraitUpsideDown) {
            [footerView setFrame:CGRectMake(0, 1004 - 20, 768, footerView.frame.size.height)];
        }else {
            [footerView setFrame:CGRectMake(0, 748 - 20, 1024, footerView.frame.size.height)];
        }
        
        [footerView rotate:[SharedHelper GetScreenOrientation] animation:YES];
        
        [layoutToReturn setFooterView:footerView];
    }
	
	return layoutToReturn;
}

@end
