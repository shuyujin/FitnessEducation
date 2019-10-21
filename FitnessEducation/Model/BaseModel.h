//
//  BaseModel.h
//  ChinaMerchants
//
//  Created by JK on 2017/8/1.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface BaseModel : NSObject <NSCoding, NSCopying>

/**
 签名
 */
@property (strong,nonatomic) NSString *sign;

/**
 操作系统 0：安卓， 1：IOS
 */
@property (strong,nonatomic) NSString *sys;


/**
 设备唯一id
 */
@property (strong,nonatomic) NSString *deviceId;

@end
