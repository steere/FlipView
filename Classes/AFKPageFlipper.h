#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@class AFKPageFlipper;


@protocol AFKPageFlipperDataSource

- (NSInteger) numberOfPagesForPageFlipper:(AFKPageFlipper *) pageFlipper;
- (UIView *) viewForPage:(NSInteger) page inFlipper:(AFKPageFlipper *) pageFlipper;

@end


typedef enum {
	AFKPageFlipperDirectionLeft,
	AFKPageFlipperDirectionRight,
} AFKPageFlipperDirection;



@interface AFKPageFlipper : UIView {
	
	// shadows
	CALayer *frontLayerShadow;
	CALayer *backLayerShadow;
	CALayer *leftLayerShadow;
	CALayer *rightLayerShadow;
	// shadows
  
	CALayer *backgroundAnimationLayer;
	CALayer *flipAnimationLayer;
	CALayer *blankFlipAnimationLayerOnLeft1;
	CALayer *blankFlipAnimationLayerOnRight1;
	
	CALayer *blankFlipAnimationLayerOnLeft2;
	CALayer *blankFlipAnimationLayerOnRight2;	
	
	AFKPageFlipperDirection flipDirection;
	float startFlipAngle;
	float endFlipAngle;
	float currentAngle;
	
	BOOL setNewViewOnCompletion;
	
	UIImage *flipIllusionPortrait;
	UIImage *flipIllusionLandscape;
	
}

@property (nonatomic,strong) NSObject <AFKPageFlipperDataSource> *dataSource;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) NSInteger numberOfPages;
@property (nonatomic,assign) NSInteger pageDifference;
@property (nonatomic,assign) BOOL disabled;
@property (nonatomic,strong) UIView *viewCurrent;
@property (nonatomic,strong) UIView *viewNew;
@property (nonatomic,readonly) BOOL animating;


- (void) setCurrentPage:(NSInteger) value animated:(BOOL) animated;

@end
