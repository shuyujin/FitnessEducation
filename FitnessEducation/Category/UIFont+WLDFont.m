//
//  UIFont+WLDFont.m
//  WeiLingDi
//
//  Created by wld-Janek on 2018/4/8.
//  Copyright © 2018年 syyp. All rights reserved.
//

#import "UIFont+WLDFont.h"

@implementation UIFont (WLDFont)

/*
 *  ⚠️以(750, 1334) 开始适配、其中6以下的机型字体大小跟6以上的机型大小有区别
 */

/**
 用在少数重要标题
 导航标题等
 */
+ (instancetype)WLD_TitleFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:16];
    }
    return [UIFont systemFontOfSize:18];
}
/**
 用在一些较为重要的标题或操作按钮
 首页名称等
 */
+ (instancetype)WLD_ButtonFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:15];
    }
    return [UIFont systemFontOfSize:16];
}

/**
 16号加粗
 */
+ (instancetype)WLD_BoldButtonFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont boldSystemFontOfSize:15];
    }
    return [UIFont boldSystemFontOfSize:16];
}

/**
 用于大段文字、文章正文
 商品标题、商品详情
 */
+ (instancetype)WLD_TextFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:13];
    }
    return [UIFont systemFontOfSize:14];
}

/**
 加粗14号
 */
+ (instancetype)WLD_BoldTextFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont boldSystemFontOfSize:13];
    }
    return [UIFont boldSystemFontOfSize:14];
}

/**
 用于少部份文字
 小标题、模块描述等等
 */
+ (instancetype)WLD_MinorityFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:12];
    }
    return [UIFont systemFontOfSize:13];
}
/**
 用于辅助性文字
 主要备注时间、地址等
 */
+ (instancetype)WLD_RemarksFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:11];
    }
    return [UIFont systemFontOfSize:12];
}
/**
 用于辅助性文字
 次要备注性信息等
 */
+ (instancetype)WLD_SecondaryRemarksFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:10];
    }
    return [UIFont systemFontOfSize:10];
}
/**
 导航栏字体大小
 */
+ (instancetype)WLD_NavBoldFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont boldSystemFontOfSize:17.0f];
    }
    return [UIFont boldSystemFontOfSize:18.0f];
}

/**
 V 4.0前
 字体变大25
 */
+ (instancetype)WLD_BoldFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont boldSystemFontOfSize:23];
    }
    return [UIFont boldSystemFontOfSize:25];
}

/**
 部分菜单栏title字体大小
 */
+ (instancetype)WLD_MenuFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:14];
    }
    return [UIFont systemFontOfSize:15];
}

/**
 店铺二维码
 */
+ (instancetype)WLD_QrCodeTitleFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:18];
    }
    return [UIFont systemFontOfSize:20];
}

/**
  小蜜标题
 */
+ (instancetype)WLD_XiaoMiTitleFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:26];
    }
    return [UIFont systemFontOfSize:28];
}


/**
 section view 字体加粗 14
 */
+ (instancetype)WLD_SectionMediumFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont fontWithName:@"PingFangSC-Medium" size:13];;
    }
    return [UIFont fontWithName:@"PingFangSC-Medium" size:14];;
}

/**
 36号字体
 */
+ (instancetype)WLD_BigFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:34];
    }
    return [UIFont systemFontOfSize:36];
}

/**
 24号字体
 */
+ (instancetype)WLD_PostersFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:23];
    }
    return [UIFont systemFontOfSize:24];
}

/**
 50号字体(核销)
 */
+ (instancetype)WLD_VerificationFont{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont systemFontOfSize:48];
    }
    return [UIFont systemFontOfSize:50];
}

// bold 字体变大
+ (instancetype)WLD_boldSystem:(NSInteger )fontInt{
    if (IS_4_0 || IS_3_5) { // 5S | 4S
        return [UIFont boldSystemFontOfSize:fontInt];
    }
    return [UIFont boldSystemFontOfSize:fontInt];
}


@end
