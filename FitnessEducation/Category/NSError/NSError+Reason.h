//
//  NSError+Reason.h
//  mgjr
//
//  Created by Apricot on 15/9/23.
//  Copyright © 2015年 wghl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Reason)

/**
 *  生成错误信息
 *
 *  @param code    code码
 *  @param message Error的文本信息（用于显示给用户看）
 *
 *  @return 返回一个错误信号
 */
+ (NSError *)errorCode:(NSInteger)code message:(NSString *)message;

/**
 *  生成错误信息 自带Code码（110）
 *
 *  @param message Error的文本信息（用于显示给用户看）
 *
 *  @return 返回一个错误信号
 */
+ (NSError *)errorMessage:(NSString *)message;

/**
 *  获取Error的文本信息
 *
 *  @return 返回error的文本信息
 */
- (NSString *)errorMessage;

@end
