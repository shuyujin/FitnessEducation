//
//  ClubUserModel.h
//  ChinaMerchants
//
//  Created by JK on 2017/8/17.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClubUserModel : NSObject

/**
 用户俱乐部身份id
 */
@property (strong,nonatomic) NSString * clubUId;

/**
 俱乐部id
 */
@property (strong,nonatomic) NSString * clubId;

/**
 用户等级
 */
@property (strong, nonatomic) NSString *vip;

/**
 俱乐部 角色 1用户 2 教练 3顾问
 */
@property (strong,nonatomic) NSString * role;

/**
 现有积分数
 */
@property (strong,nonatomic) NSString * points;

/**
 总积分数
 */
@property (strong,nonatomic) NSString * totalPoints;

-(NSString *)vipLevel;

@end
