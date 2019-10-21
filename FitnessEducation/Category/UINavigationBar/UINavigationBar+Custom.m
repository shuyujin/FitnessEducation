//
//  UINavigationBar+Custom.m
//  VillagePlay
//
//  Created by Apricot on 16/10/25.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "UINavigationBar+Custom.h"

@implementation UINavigationBar (Custom)
- (void)xx_titleStyle{
    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIColor colorWithRed:11.0/255.0 green:30.0/255.0 blue:48.0/255.0 alpha:1.0],
                                  NSForegroundColorAttributeName,
                                  [UIFont fontWithName:@"PingFangSC-Regular" size:17],NSFontAttributeName,nil]];
}
- (void)xx_titleStyleWithColor:(UIColor *)color{
    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  color,NSForegroundColorAttributeName,
                                  [UIFont fontWithName:@"PingFangSC-Regular" size:17],NSFontAttributeName,nil]];
}
@end
