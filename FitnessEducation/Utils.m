//
//  Utils.m
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import "Utils.h"
#import <CommonCrypto/CommonDigest.h>


@implementation Utils


/**
 *  判断是否是初次安装或更新
 *
 *  @return YES/NO
 */
+ (BOOL) isFirstRun {
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey:CURRENT_APP_VERSION])//显示欢迎页面 用app version做对比
    {
        [defaults setBool:YES  forKey:CURRENT_APP_VERSION];
        [defaults synchronize];
        return YES;
    }
    else{
        return NO;
    }
}

/**
 *  字符串转颜色
 *
 *  @param stringToConvert 16进制色值
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

/********【加密】*********/

//对一个字符串进行base64编码
+ (NSString *)base64EncodeString:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}
//对一个字符串进行base解码
+ (NSString *)base64decodeString:(NSString *)string
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}


/**
 *  MD5加密
 */
+ (NSString *)MD5:(NSString *)str {
    
    const char *cStr = [str UTF8String];
    
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), r);
    
    NSString * md5String=[NSString stringWithFormat:
                          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",r[0], r[1], r[2], r[3],r[4], r[5], r[6], r[7],r[8], r[9], r[10], r[11],r[12], r[13], r[14], r[15]
                          ];
    
    return [md5String uppercaseString];
}

/**
 *  url 加密
 *
 *  @param params 参数拼接字符串
 *  @param timeSp 时间戳
 *
 *  @return 加密后的token
 */
+ (NSString *)url_base64_Md5:(NSString *)params timeSp:(NSString *)timeSp {
    
    //    NSString *string1 = [[NSString alloc] init];
    
    //1.参数键值进行base64编码
    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64Encoded = [data base64EncodedStringWithOptions:0];
    
    //2.编码KEY+string1+timeSp 进行base64编码
    NSString *string2 = [NSString stringWithFormat:@"WEIYUQWERAS%@%@",timeSp,base64Encoded];
    data = [string2 dataUsingEncoding:NSUTF8StringEncoding];
    base64Encoded = [data base64EncodedStringWithOptions:0];
    
    //3.MD5加密
    NSString *token = [self MD5:base64Encoded];
    
    return token;
}


@end
