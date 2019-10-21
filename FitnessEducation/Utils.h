//
//  Utils.h
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject



/**
 *  判断是否是初次安装或更新
 *
 *  @return YES/NO
 */
+ (BOOL) isFirstRun;

/**
 *  字符串转颜色
 *
 *  @param stringToConvert 16进制色值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/********【加密】*********/

//对一个字符串进行base64编码
+ (NSString *)base64EncodeString:(NSString *)string;

//对一个字符串进行base解码
+ (NSString *)base64decodeString:(NSString *)string;


/**
 *  MD5加密
 */
+ (NSString *)MD5:(NSString *)str;
/**
 *  url 加密
 *
 *  @param params 参数拼接字符串
 *  @param timeSp 时间戳
 *
 *  @return 加密后的token
 */
+ (NSString *)url_base64_Md5:(NSString *)params timeSp:(NSString *)timeSp;


@end

NS_ASSUME_NONNULL_END
