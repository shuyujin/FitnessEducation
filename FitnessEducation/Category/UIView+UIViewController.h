//
//  UIView+UIViewController.h
//  05 Responder
//
//  Created by lois on 14-8-23.
//  Copyright (c) lushan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewController)

/*
 * 通过响应者链，取得此视图所在的视图控制器
 */
- (UIViewController *)viewController;

/*
 * 获取当前屏幕显示的 ViewController
 */
- (UIViewController *)getCurrentVC;

/*
 * UISearchBar 默认的圆角矩形的圆角改大，顶端改成圆形的。
 */
- (UIView*)subViewOfClassName:(NSString*)className;

@end
