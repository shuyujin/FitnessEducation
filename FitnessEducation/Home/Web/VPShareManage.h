//
//  VPShareManage.h
//  VillagePlay
//
//  Created by  JK on 16/10/17.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHTypeEnum.h"
#import <UMSocialCore/UMSocialCore.h>

///**
// *  分享的来源枚举 比如村庄，活动...
// */
//typedef enum:NSInteger{
//
//    ShareSourceActivedetail = 0 ,
//    ShareSourceTowndetail = 1,
//    ShareSourceTopicdetail = 2,
//    ShareSourceTravelDetail = 3,
//    ShareSourceVillagedetail = 4,
//    ShareSourceApp ,
//}ShareSource;

@interface VPShareManage : NSObject

/**
 *  单例 初始化
 *
 *  @return
 */
+(instancetype)sharedinstance;

/**
 *  网页分享
 *
 *  @param platform  分享数据来源（比如活动）
 *  @param title     标题
 *  @param descr     分享内容描述
 *  @param thumImage 图片
 *  @param shareUrl 分享类型（比如微信）
 */
+(void)getShareWebPageToPlatform:(VPChannelType)platform title:(NSString *)title descr:(NSString *)descr shareUrl:(NSString *)shareUrl thumImage:(id)thumImage;

@end
