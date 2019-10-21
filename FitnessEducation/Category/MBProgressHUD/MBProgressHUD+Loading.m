//
//  MBProgressHUD+Loading.m
//  anrigo
//
//  Created by Liu Zhen on 11/23/14.
//  Copyright (c) 2014 ft. All rights reserved.
//

#import "MBProgressHUD+Loading.h"
#import "AppDelegate.h"

@implementation MBProgressHUD (Loading)

static MBProgressHUD *hud = nil;

+ (void)hide
{
    [hud hide:YES];
}

+ (MBProgressHUD *)createHUD{
    MBProgressHUD * progressHud = nil;
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UIWindow *window = delegate.window;
    
    if(window.rootViewController)
    {
        if([window.rootViewController isKindOfClass:[UITabBarController class]]){
            UITabBarController *tabBarVC = (UITabBarController *)window.rootViewController;
            if(tabBarVC.presentedViewController){
                progressHud = [MBProgressHUD showHUDAddedTo:tabBarVC.presentedViewController.view animated:YES];
                return progressHud;
            }
        }
        progressHud = [MBProgressHUD showHUDAddedTo:window.rootViewController.view animated:YES];
        
    }
    else
    {
        progressHud = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
    }
    return progressHud;
}

+ (void)showWithImage:(NSString *)imageName title:(NSString *)title
{
    if (hud) {
        [hud hide:YES];
    }
    
    hud = [MBProgressHUD createHUD];
    
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    UIWindow *window = delegate.window;
//    
//    if(window.rootViewController){
//        hud = [MBProgressHUD showHUDAddedTo:window.rootViewController.view animated:YES];
//    }
//    else{
//        hud = [[MBProgressHUD alloc]initWithWindow:[UIApplication sharedApplication].keyWindow];
//    }
    
    
    hud.mode = MBProgressHUDModeCustomView;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    hud.customView = imageView;
    hud.labelText = title;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
}

+ (void)showCompleted{
    
    UIImageView *imageView;
    UIImage *image = [UIImage imageNamed:@"37x-Checkmark"];
    imageView = [[UIImageView alloc] initWithImage:image];
    hud.customView = imageView;
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = @"完成";

    [hud hide:YES afterDelay:2];
}

+ (void)showLoading
{
    if (hud) {
        [hud hide:YES];
    }
    hud = [MBProgressHUD createHUD];
    
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    UIWindow *window = delegate.window;
//    
//    if(window.rootViewController){
//         hud = [MBProgressHUD showHUDAddedTo:window.rootViewController.view animated:YES];
//    }
//    else{
//        hud = [[MBProgressHUD alloc] initWithWindow:[UIApplication sharedApplication].keyWindow];
//    }
    
    hud.mode = MBProgressHUDModeIndeterminate;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading"]];
    
    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation( - M_PI, 0, 0, 1)];
    transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    transformAnimation.duration = 0.5f;
    transformAnimation.autoreverses = NO;
    transformAnimation.repeatCount = HUGE_VALF;
    transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [imageView.layer addAnimation:transformAnimation forKey:@"LogindAnimation"];

    hud.customView = imageView;
    
    hud.removeFromSuperViewOnHide = YES;
}



+ (void)showTip:(NSString *)tip {
    
    if (hud) {
        [hud hide:YES];
    }
    hud = [MBProgressHUD createHUD];
    
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    UIWindow *window = delegate.window;
//    
//    if(window.rootViewController)
//    {
//        if([window.rootViewController isKindOfClass:[UITabBarController class]]){
//            UITabBarController *tabBarVC = (UITabBarController *)window.rootViewController;
//            if(tabBarVC.presentedViewController){
//                hud = [MBProgressHUD showHUDAddedTo:tabBarVC.presentedViewController.view animated:YES];
//                return;
//            }
//        }
//        hud = [MBProgressHUD showHUDAddedTo:window.rootViewController.view animated:YES];
//
//    }
//    else
//    {
//        hud = [[MBProgressHUD alloc]initWithWindow:[UIApplication sharedApplication].keyWindow];
//    }
    
    hud.labelFont = [UIFont systemFontOfSize:13];
    hud.labelText = tip;
//
//    hud.detailsLabel.font = [UIFont systemFontOfSize:13];
//    hud.detailsLabel.text = tip;
    hud.mode = MBProgressHUDModeText;
    
    CGFloat basicTime = 0.7f;
    NSInteger length = tip.length;
    if(length > 30)
    {
        length = 30;
    }
    [hud hide:YES afterDelay:1.3];
//    [hud hideAnimated:YES afterDelay:2];
//    [hud hide:YES afterDelay:basicTime + (length - 4) / 4.f * basicTime];
}

+ (void)showLoadingWithTip:(NSString *)tip
{
    [self showLoading];
    hud.labelText = tip;
}

+ (void)resetAnimation
{
    if(hud.customView && hud.mode == MBProgressHUDModeCustomView)
    {
        if([hud.customView isKindOfClass:[UIImageView class]])
        {
            UIImageView *imageView = (UIImageView *)hud.customView;
            
            CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
            transformAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation( - M_PI, 0, 0, 1)];
            transformAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
            transformAnimation.duration = 0.5f;
            transformAnimation.autoreverses = NO;
            transformAnimation.repeatCount = HUGE_VALF;
            transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            
            [imageView.layer removeAnimationForKey:@"LogindAnimation"];
            [imageView.layer addAnimation:transformAnimation forKey:@"LogindAnimation"];
        }
    }
}
+(void)showLoadingWithView:(UIView *)view{
    if (hud) {
        [hud hide:YES];
    }
    
    hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.removeFromSuperViewOnHide = YES;
}
@end
