//
//  WebController.hController
//  ChinaMerchants
//
//  Created by JK on 2017/8/4.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "WLDSBaseViewController.h"
#import "CHTypeEnum.h"
#import "GrowthRecordListModel.h"


typedef void(^WebControllerBlock)(void);

@interface WebController : WLDSBaseViewController

+ (instancetype)instantiation;

@property (strong,nonatomic)NSString * urlString;

/**
 新闻id或者活动id
 */
@property (strong, nonatomic) NSString * webId;

/**
 成长记录提交数据
 */
@property (strong, nonatomic) GrowthRecordListModel * growthRecordModel;

/**
 用于区分进入网页
 */
@property (assign, nonatomic) WebComeFromType comeFromType;

@property (strong, nonatomic) WebControllerBlock tappenBlock;

@end
