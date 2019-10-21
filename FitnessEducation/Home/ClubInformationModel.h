//
//  ClubInformationModel.h
//  ChinaMerchants
//
//  Created by JK on 2017/8/22.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClubInformationModel : NSObject

/**
 资讯新闻id
 */
@property (strong, nonatomic) NSString *newsId;

/**
 标题
 */
@property (strong, nonatomic) NSString *title;

/**
 简介
 */
@property (strong, nonatomic) NSString *introduction;

/**
 封面图片地址
 */
@property (strong, nonatomic) NSString *imgUrl;

/**
 排序
 */
@property (strong, nonatomic) NSString *sortNum;

/**
 评论数
 */
@property (strong, nonatomic) NSString *commentNum;

/**
 点赞数
 */
@property (strong, nonatomic) NSString *likesNum;

/**
 更新时间
 */
@property (strong, nonatomic) NSString *updateTime;

/**
 发布时间
 */
@property (strong, nonatomic) NSString *createdTime;

@end
