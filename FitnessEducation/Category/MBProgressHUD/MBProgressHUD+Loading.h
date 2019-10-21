//
//  MBProgressHUD+Loading.h
//  anrigo
//
//  Created by Liu Zhen on 11/23/14.
//  Copyright (c) 2014 ft. All rights reserved.
//

#import "MBProgressHUD.h"
#import "NSError+Reason.h"
@interface MBProgressHUD (Loading)

/**
 *  转圈
 */
+ (void)showLoading;
/**
 *  加载
 *
 *  @param tip <#tip description#>
 */
+ (void)showLoadingWithTip:(NSString *)tip;
/**
 *  错误提示
 *
 *  @param tip <#tip description#>
 */
+ (void)showTip:(NSString *)tip;

/**
 *  显示图片带标题
 *
 *  @param imageName <#imageName description#>
 *  @param title     <#title description#>
 */
+ (void)showWithImage:(NSString *)imageName title:(NSString *)title;

/**
 *  隐藏
 */
+ (void)hide;

+ (void)resetAnimation;

/**
 *  <#Description#>
 *
 *  @param view <#view description#>
 */
+ (void)showLoadingWithView:(UIView *)view;

@end
