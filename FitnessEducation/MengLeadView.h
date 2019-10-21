
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LeadViewOverStyle) {
    byAlpha = 0,           
    byCenter,
    byAlphaAndCenter,
};

@protocol MengLeadViewDelegate <NSObject>

- (void)animationDidFinish;
//- (void)buttonPressedIndex:(int)index;
@end

@interface MengLeadView : UIViewController <UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, assign)id<MengLeadViewDelegate> delegate;
@property (nonatomic, assign)LeadViewOverStyle overstyle;
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)NSArray *titleArray;
@property (nonatomic, strong)NSArray *desArray;
@property (nonatomic, assign)NSInteger wihts;

//- (id)initWithImages:(NSArray *)image_array array:(NSArray *)name_array;

@end
