//
//  ActivityListModel.h
//  ChinaMerchants
//
//  Created by JK on 2017/8/24.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityListModel : NSObject

/**
 活动id
 */
@property (strong, nonatomic) NSString * activityId;

/**
 标题
 */
@property (strong, nonatomic) NSString * titile;

/**
 图片
 */
@property (strong, nonatomic) NSString * imgUrl;

/**
 关系地址
 */
@property (strong, nonatomic) NSString * relationUrl;


@end
