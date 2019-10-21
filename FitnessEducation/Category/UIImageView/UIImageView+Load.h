//
//  UIImageView+Load.h
//  WYWProject
//
//  Created by Apricot on 2017/7/10.
//  Copyright © 2017年 Apricot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Load)

/**
 *  下载图片
 *
 *  @param imageURLStr 图片的URL
 */
- (void)xx_setImageWithURLStr:(nullable NSString *)imageURLStr;

/**
 *  项目中是用的图片加载
 *
 *  @param imageURLStr 图片的URL字符串
 *  @param placeholder 默认显示的图(UIImage,如果还未有填充图 该值填nil或者@"")
 */
- (void)xx_setImageWithURLStr:(nullable NSString *)imageURLStr placeholder:(nullable UIImage *)placeholder;

@end
