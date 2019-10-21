//
//  UIColor+WLDColor.m
//  WeiLingDi
//
//  Created by wld_02 on 2017/12/13.
//  Copyright © 2017年 syyp. All rights reserved.
//

#import "UIColor+WLDColor.h"

@implementation UIColor (WLDColor)
/*
 *  主色调
 */
+ (instancetype) WLD_MainColor{
    
    return [Utils colorWithHexString:@"#46aafa"];
    
}

/*
 *  提示框文字
 */
+ (instancetype) WLD_promptColor{
    
    return [Utils colorWithHexString:@"#1F2223"];
}

/*
 *  提示框分割线
 */
+ (instancetype) WLD_promptLineColor{
    
    return [Utils colorWithHexString:@"#EDEDED"];
}

/*
 *  黄色
 */
+ (instancetype) WLD_YellowColor{
    
    return [Utils colorWithHexString:@"#FFE400"];
    
}

/*
 *  用于危险操作的button、icon，重要提示
 */
+ (instancetype) WLD_DangerColor{
    return [Utils colorWithHexString:@"#FF4A4A"];
}

/*
 *   用于应用内的icon + 导航栏颜色
 */
+ (instancetype)WLD_AppIconColor{
    
    return [Utils colorWithHexString:@"#222222"];
}

/*
 * 用于列表分隔线、标签描边等
 */
+ (instancetype)WLD_LineColor{
    
    return [Utils colorWithHexString:@"#EBEBEB"];
}

/*
 *  用于页面底色/搜索框等
 */
+ (instancetype)WLD_PageBackgroundColor{
    
    return [Utils colorWithHexString:@"#EEF0F5"];
}

/*
 *  用于留白背景色等  ++ 外加导航栏颜色
 */
+ (instancetype)WLD_LeaveBlankColor{
    
    return [Utils colorWithHexString:@"#ffffff"];
}

/*
 *  二级文字/正文
 */
+ (instancetype)WLD_TextColor{
    return [Utils colorWithHexString:@"#666666"];
}

/*
 *  底部标签文字/次要文字/说明文字/输入框文字
 */
+ (instancetype)WLD_InstructionsColor{
    return [Utils colorWithHexString:@"#999999"];
}

/*
 *链接文字
 */
+ (instancetype)WLD_LinkColor{
    return [Utils colorWithHexString:@"#4688F4"];
}

/*
 *字体红色
 */
+ (instancetype)WLD_RedNumberColor{
    return [Utils colorWithHexString:@"#FF4949"];
}

/*
 *搜索闪的那根线
 */
+ (instancetype)WLD_SearchGrayLineColor{
    return [Utils colorWithHexString:@"#979797"];
}

/*
 * 水印文字 
 */
+ (instancetype)WLD_PlaceHolderColor{
    return [Utils colorWithHexString:@"#DDDDDD"];
}

/**
 登录输入框背景色
 */
+ (instancetype)WLD_LoginTextColor{
    
    return [Utils colorWithHexString:@"#F8F8F8"];
}

/*
 *  (蓝色)
 */
+ (instancetype)WLD_BlueColor{
    return [Utils colorWithHexString:@"#46AAFA"];
}

/////////////////////////

/*
 * V4.0前的颜色 (下划线线的颜色---灰色)
 */
+ (instancetype)WLD_LineGrayColor{
     return [Utils colorWithHexString:@"#D8D8D8"];
}

/*
 * 按钮字体颜色
 */
+ (instancetype)WLD_ButtonTitleColor{
    return [Utils colorWithHexString:@"#5770BE"];
}

/*
 * 商城商品分类标签
 */
+ (instancetype)WLD_MallGoodsTitleColor{
    return [Utils colorWithHexString:@"#595757"];
}

/*
 * 商品描述按钮背景色不可点击时颜色
 */
+ (instancetype)WLD_NotClickButtonColor{
    return [Utils colorWithHexString:@"#FFF17F"];
}

/*
 * 商品描述按钮不可点击时字体颜色
 */
+ (instancetype)WLD_NotClickButtonTitleColor{
    return [Utils colorWithHexString:@"#AAA36A"];
}

//用户文字的颜色
+ (instancetype)WLD_BrandTitleColor{
     return [Utils colorWithHexString:@"#333333"];
}

// 营销中心的蓝色
+ (instancetype)WLD_CommonlyBlueColor{
    return [Utils colorWithHexString:@"#488AF5"];
}

/*
 * 卡片cell背景色
 */
+ (instancetype)WLD_CellBackgoundColor{
    
    return [Utils colorWithHexString:@"#F8FAFF"];
}

/**
 卡券领取详情价格及折扣颜色
 */
+ (instancetype)WLD_ReceivePriceColor{
    
    return [Utils colorWithHexString:@"#FF4B4B"];
}

/**
 卡券领取详情时间颜色
 */
+ (instancetype)WLD_ReceiveTimeColor{
    
    return [Utils colorWithHexString:@"#A4A8AB"];
    
}

/**
 空间地址字体颜色
 */
+ (instancetype)WLD_SpaceAddressTextColor{
    
    return [Utils colorWithHexString:@"#C0B798"];
}

/**
 空间地址字体背景颜色
 */
+ (instancetype)WLD_SpaceAddressTextBackgoundeColor{
    
    return [Utils colorWithHexString:@"#F5F4EE"];
}

/**
 空间数量颜色
 */
+ (instancetype)WLD_SpaceNumberColor{
    
    return [Utils colorWithHexString:@"#262626"];
}

/**
 标签
 */
+ (instancetype)WLD_TagLabelColor{
    
    return [Utils colorWithHexString:@"#6CA1FF"];
}

/**
 商品详情是否支持返佣
 */
+ (instancetype)WLD_ShopTitlekColor{
    
    return [Utils colorWithHexString:@"#FA3155"];
}

/**
 失效卡券颜色字体
 */
+ (instancetype)WLD_CarLosetextColor{
    
    return [Utils colorWithHexString:@"#ACABAB"];
}

/**
 购买人数界面已关注按钮颜色
 */
+ (instancetype)WLD_AttentionedButtonColor{
    
    return [Utils colorWithHexString:@"#DFDFDF"];
}

/**
 橙色
 */
+ (instancetype)WLD_ORANGE {
    
    return RGBCOLOR(253, 172, 75);
}

/**
 灰色背景色（列表等）
 */
+ (instancetype)WLD_BG_GRAY {
    
    return [Utils colorWithHexString:@"#f0f0f0"];
}

/**
 黄色背景色
 */
+ (instancetype)WLD_BG_Yellow {
    
    return [Utils colorWithHexString:@"#FDE200"];
}

/**
 黄色状态色
 */
+ (instancetype)WLD_StateYellow {
    
    return [Utils colorWithHexString:@"#FF9A00"];
}


@end
