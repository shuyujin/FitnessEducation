//
//  UIFont+WLDFont.h
//  WeiLingDi
//
//  Created by wld-Janek on 2018/4/8.
//  Copyright © 2018年 syyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (WLDFont)

/*
 *  ⚠️以(750, 1334)iPhone6--开始适配、其中6以下的机型字体大小跟6以上的机型大小有区别
 */


/**
 用在少数重要标题
    导航标题等
 */
+ (instancetype)WLD_TitleFont;
/**
 用在一些较为重要的标题或操作按钮
    首页名称等
 */
+ (instancetype)WLD_ButtonFont;
/**
用于大段文字、文章正文
    商品标题、商品详情
 */
+ (instancetype)WLD_TextFont;
/**
 用于少部份文字
    小标题、模块描述等等
 */
+ (instancetype)WLD_MinorityFont;
/**
 用于辅助性文字
    主要备注时间、地址等
 */
+ (instancetype)WLD_RemarksFont;
/**
 用于辅助性文字
 次要备注性信息等
 */
+ (instancetype)WLD_SecondaryRemarksFont;
/**
 导航栏字体大小
 */
+ (instancetype)WLD_NavBoldFont;
/**
 字体变大25
 */
+ (instancetype)WLD_BoldFont;

/**
 部分菜单栏title字体大小
 */
+ (instancetype)WLD_MenuFont;

/**
 店铺二维码
 */
+ (instancetype)WLD_QrCodeTitleFont;

/**
 小蜜标题
 */
+ (instancetype)WLD_XiaoMiTitleFont;

/**
 section view 字体加粗 14
 */
+ (instancetype)WLD_SectionMediumFont;

/**
 36号字体
 */
+ (instancetype)WLD_BigFont;

/**
 16号加粗
 */
+ (instancetype)WLD_BoldButtonFont;

/**
 加粗14号
 */
+ (instancetype)WLD_BoldTextFont;

/**
 24号字体
 */
+ (instancetype)WLD_PostersFont;

/**
 50号字体
 */
+ (instancetype)WLD_VerificationFont;

// bold 字体变大
+ (instancetype)WLD_boldSystem:(NSInteger )fontInt;
@end
