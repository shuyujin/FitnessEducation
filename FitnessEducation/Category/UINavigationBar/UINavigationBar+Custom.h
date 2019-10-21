//
//  UINavigationBar+Custom.h
//  VillagePlay
//
//  Created by Apricot on 16/10/25.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Custom)

/**
 *  用于下乡客的Navigation Title 样式
 */
- (void)xx_titleStyle;
/**
 *  同上 可代入颜色
 *
 *  @param color title的颜色
 */
- (void)xx_titleStyleWithColor:(UIColor *)color;
@end
