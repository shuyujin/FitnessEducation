//
//  UIView+UIViewController.h
//  05 Responder
//
//  Created by lois on 14-8-23.
//  Copyright (c) lushan. All rights reserved.
//

#import "UIView+UIViewController.h"
//#import "LoginRegistController.h"

@implementation UIView (UIViewController)

/*
 * 通过响应者链，取得此视图所在的视图控制器
 */
- (UIViewController *)viewController {
    
    //通过响应者链，取得此视图所在的视图控制器
    UIResponder *next = self.nextResponder;
    do {
        
        //判断响应者对象是否是视图控制器类型
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
        
    }while(next != nil);
    
    return nil;
}

/*
 * 获取当前屏幕显示的 ViewController
 */
- (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    //获取当前屏幕显示的viewcontroller
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        
//        if ([rootVC isKindOfClass:[LoginRegistController class]]) { // 模态上来的类|不需要进行下一步不然有时会闪
//            return currentVC;
//        }
        UITabBarController *tabbarVC = ((UITabBarController*)APP_Delegate.window.rootViewController).selectedViewController;
        if (tabbarVC.viewControllers>0) {
            //（获取不到情况下-UITabBarController，UINavigationController）
            //（ tabbarVC -获取第一个viewController）
            UIViewController *firstVc = tabbarVC.viewControllers[tabbarVC.viewControllers.count - 1];
            currentVC = firstVc;
        }else{
            // 根视图为非导航类
            currentVC = rootVC;
        }
    }
    
    return currentVC;
}

//  UISearchBar 默认的圆角矩形的圆角改大，顶端改成圆形的。

- (UIView*)subViewOfClassName:(NSString*)className {
    for (UIView* subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }
        
        UIView* resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }
    return nil;
}


@end
