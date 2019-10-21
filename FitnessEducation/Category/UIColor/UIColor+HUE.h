//
//  UIColor+HUE.h
//  HotelBusiness
//
//  Created by  JK on 16/7/21.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HUE)

/**
 *  Navigation 背景颜色
 *
 *  @return 返回导航栏背景颜色
 */
+ (UIColor *)navigationBarTintColor;

/**
*  Navigation 返回按钮颜色
*
*  @return 返回导航栏的返回按钮颜色
*/
+ (UIColor *)navigationTintColor;


/**
 导航栏底部的线条

 @return 返回导航栏底部的线条颜色
 */
+ (UIColor *)navigationBottonLineView;

/**
 *  Navigation title 颜色
 *
 *  @return 返回导航栏title的颜色
 */
+ (UIColor *)navigationTitleColor;

/**
 *  tab 默认的色彩
 *
 *  @return 返回Tab未选中颜色
 */
+ (UIColor *)tabBarTintColor;

/**
 *  Tab 选中的颜色
 *
 *  @return 返回Tab的选中的颜色
 */
+ (UIColor *)tabTintColor;


/**
 *  灰色间隔线颜色
 *
 *  @return 间隔线颜色
 */
+ (UIColor *)septalLineColor;

/**
 *  控制器背景颜色
 *
 *  @return 控制器背景颜色
 */
+ (UIColor *)controllerBackgroundColor;


/**
 *  红色
 *
 *  @return 返回红色
 */
+(UIColor *)VPRedColor;

/**
 主色

 @return <#return value description#>
 */
+(UIColor *)VPMainColor;

/**
 *  灰色字体
 *
 *  @return 灰黑色
 */
+(UIColor *)VPDetailColor;

/**
 *  标题颜色
 *
 *  @return 黑色
 */
+(UIColor *)VPTitleColor;

/**
 *  内容颜色
 *
 *  @return 黑色
 */
+(UIColor *)VPContentColor;


/**
 *  订单状态颜色
 *
 *  @return 橘红色
 */
+(UIColor *)VPOrderColor;

/**
 备选按钮灰

 @return <#return value description#>
 */
+(UIColor *)btnColor;


@end
