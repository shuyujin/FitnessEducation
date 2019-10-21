//
//  UIColor+WLDColor.h
//  WeiLingDi
//
//  Created by wld_02 on 2017/12/13.
//  Copyright © 2017年 syyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WLDColor)

/*
 *主色调
 */
+ (instancetype)WLD_MainColor;

/*
 *  黄色
 */
+ (instancetype) WLD_YellowColor;

/*
 *  用于危险操作的button、icon，重要提示 /当前价格文字
 */
+ (instancetype) WLD_DangerColor;

/*
 *   用于应用内的icon / 一级文字/标题
 */
+ (instancetype)WLD_AppIconColor;

/*
 * 用于分隔线、标签描边等
 */
+ (instancetype)WLD_LineColor;

/*
 *  用于页面底色/搜索框等
 */
+ (instancetype)WLD_PageBackgroundColor;

/*
 *  用于留白背景色等 /反白文字
 */
+ (instancetype)WLD_LeaveBlankColor;

/*
 *  二级文字/正文
 */
+ (instancetype)WLD_TextColor;

/*
 *  底部标签文字/次要文字/说明文字/输入框文字
 */
+ (instancetype)WLD_InstructionsColor;

/*
 *链接文字
 */
+ (instancetype)WLD_LinkColor;

/*
 *字体红色
 */
+ (instancetype)WLD_RedNumberColor;

/*
 *搜索闪的那根线
 */
+ (instancetype)WLD_SearchGrayLineColor;

/*
 * 水印文字
 */
+ (instancetype)WLD_PlaceHolderColor;

/**
 登录输入框背景色
 */
+ (instancetype)WLD_LoginTextColor;

///////////////////////////////
/*
 * V4.0前的颜色
 */
+ (instancetype)WLD_BlueColor;

/*
 * (下划线线的颜色---灰色)
 */
+ (instancetype)WLD_LineGrayColor;

/*
 * 按钮字体颜色
 */
+ (instancetype)WLD_ButtonTitleColor;

/*
 * 商城商品分类标签
 */
+ (instancetype)WLD_MallGoodsTitleColor;

/*
 *  提示框文字
 */
+ (instancetype) WLD_promptColor;

/*
 *  提示框分割线
 */
+ (instancetype) WLD_promptLineColor;


/*
 * 商品描述按钮不可点击时颜色
 */
+ (instancetype)WLD_NotClickButtonColor;

/*
 * 商品描述按钮不可点击时字体颜色
 */
+ (instancetype)WLD_NotClickButtonTitleColor;

//用户文字的颜色
+ (instancetype)WLD_BrandTitleColor;

// 营销中心的蓝色
+ (instancetype)WLD_CommonlyBlueColor;

/*
 * 卡片cell背景色
 */
+ (instancetype)WLD_CellBackgoundColor;

/**
 卡券领取详情价格及折扣颜色
 */
+ (instancetype)WLD_ReceivePriceColor;

/**
 卡券领取详情时间颜色
 */
+ (instancetype)WLD_ReceiveTimeColor;

/**
 空间地址字体颜色
 */
+ (instancetype)WLD_SpaceAddressTextColor;

/**
 空间地址字体背景颜色
 */
+ (instancetype)WLD_SpaceAddressTextBackgoundeColor;


/**
 空间数量颜色
 */
+ (instancetype)WLD_SpaceNumberColor;

/**
 标签
 */
+ (instancetype)WLD_TagLabelColor;

/**
 商品详情是否支持返佣
 */
+ (instancetype)WLD_ShopTitlekColor;

/**
 失效卡券颜色字体
 */
+ (instancetype)WLD_CarLosetextColor;

/**
 购买人数界面已关注按钮颜色
 */
+ (instancetype)WLD_AttentionedButtonColor;

/**
 橙色
 */
+ (instancetype)WLD_ORANGE;

/**
 灰色背景色（列表等）
 */
+ (instancetype)WLD_BG_GRAY;

/**
 黄色背景色
 */
+ (instancetype)WLD_BG_Yellow;


/**
 黄色状态色
 */
+ (instancetype)WLD_StateYellow;



@end
