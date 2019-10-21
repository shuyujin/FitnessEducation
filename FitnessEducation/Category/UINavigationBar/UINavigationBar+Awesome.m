//
//  UINavigationBar+Awesome.m
//  LTNavigationBar
//
//  Created by ltebean on 15-2-15.
//  Copyright (c) 2015 ltebean. All rights reserved.
//

#import "UINavigationBar+Awesome.h"
#import <objc/runtime.h>

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@implementation UINavigationBar (Awesome)
static char overlayKey;
static char bottomLineKey;


- (UIView *)bottomLineView{
    return objc_getAssociatedObject(self, &bottomLineKey);

}
- (void)setBottomLineView:(UIView *)bottomLineView
{
    objc_setAssociatedObject(self, &bottomLineKey, bottomLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor lineView:(UIColor *)lineViewColor{
    
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
         
        CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
        //标题栏
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.frame) + CGRectGetHeight(statusRect))];
        if(!self.bottomLineView){
            self.bottomLineView= [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds) + CGRectGetHeight(statusRect)-0.5, CGRectGetWidth(self.bounds), 0.5)];
            [self.overlay addSubview:self.bottomLineView];
        }

        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth;    // Should not set `UIViewAutoresizingFlexibleHeight`
        [[self.subviews firstObject] insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
    self.bottomLineView.backgroundColor = lineViewColor;
//    [UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:223.0/255.0 alpha:1.0];
}

- (void)lt_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)lt_setElementsAlpha:(CGFloat)alpha
{
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
//    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

- (void)lt_reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.bottomLineView removeFromSuperview];
    [self.overlay removeFromSuperview];
    self.bottomLineView = nil;
    self.overlay = nil;
}

@end
