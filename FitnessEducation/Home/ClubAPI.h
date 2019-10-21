//
//  ClubAPI.h
//  ChinaMerchants
//
//  Created by JK on 2017/8/17.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "XXAPI.h"

@interface ClubAPI : XXAPI

/**
 俱乐部轮播图

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClubBannerParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 俱乐部列表

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClubListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;


/**
 用户进入俱乐部

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)UesrEnterclubParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 俱乐部详情

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClubeDetailParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 俱乐部教练

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClubCoachListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 获取默认俱乐部id

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)getDefaultclubParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 俱乐部视频列表

 @param parameters 参数信息
 @param success 成功会回调
 @param failure 失败回调
 */
-(void)ClubVideListParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 俱乐部视屏详情
 
 @param parameters 参数信息
 @param success 成功会回调
 @param failure 失败回调
 */
-(void)ClubSynopsisDetailsParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 俱乐部新闻列表

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClubInformationParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 平台活动

 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ActivitylistParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

/**
 俱乐部活动
 
 @param parameters 参数信息
 @param success 成功回调
 @param failure 失败回调
 */
-(void)ClubActivitylistParameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure;

@end
