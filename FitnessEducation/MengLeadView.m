
#import "MengLeadView.h"
#import "UIImageView+WebCache.h"
#import "TabbarViewController.h"
#import "AppDelegate.h"

@implementation MengLeadView
@synthesize delegate = _delegate;
@synthesize overstyle = _overstyle;
@synthesize pageControl;
@synthesize scrollView;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray *image_array;
        if (IS_3_5) {
            image_array = @[@"Ydy640x960_P1",@"Ydy640x960_P2",@"Ydy640x960_P3",@"Ydy640x960_P4"];
        }
        else  if(IS_5_8){
            image_array = @[@"Ydy1125x2436_P1",@"Ydy1125x2436_P2",@"Ydy1125x2436_P3",@"Ydy1125x2436_P4"];
        }
        else if(IS_6_1 || IS_6_5) {
            image_array = @[@"Ydy1242x2688_P1",@"Ydy1242x2688_P2",@"Ydy1242x2688_P3",@"Ydy1242x2688_P4"];
        }
        else {
            image_array = @[@"Ydy1242x2208_P1",@"Ydy1242x2208_P2",@"Ydy1242x2208_P3",@"Ydy1242x2208_P4"];
        }
        self.overstyle = byAlpha;
        self.view.frame = CGRectMake(0, VIEW_TOP, Main_Screen_Width, Main_Screen_Height);
        
        scrollView = [[UIScrollView alloc] init];
        scrollView.frame = self.view.bounds;
        scrollView.contentSize = CGSizeMake(Main_Screen_Width*image_array.count, 100);
        scrollView.scrollEnabled = YES;
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.tag = 200;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.backgroundColor = [UIColor whiteColor];
        
        
        for (int i = 0; i<image_array.count; i++) {
            
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(Main_Screen_Width*i, 0, Main_Screen_Width, Main_Screen_Height)];
            
            [imageView setImage:[UIImage imageNamed:[image_array objectAtIndex:i]]];
            
            if (i == image_array.count-1) {
                
                imageView.userInteractionEnabled = YES;
                UITapGestureRecognizer *TapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goInApp)];
                [imageView addGestureRecognizer:TapRecognizer];
                TapRecognizer.delegate = self;
            }
            
            [scrollView addSubview:imageView];
        }
        
        
        [self.view addSubview:scrollView];
    }
    return self;
}


- (void)goInApp {
   
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    TabbarViewController *tab = [TabbarViewController instantiation];
    app.window.rootViewController = tab;
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

@end


