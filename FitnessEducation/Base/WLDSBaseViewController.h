//
//  WLDBaseViewController.h
//  WeiLingDing_Ipad
//
//  Created by wld on 2018/8/21.
//  Copyright © 2018年 wldIos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"

@interface WLDSBaseViewController : UIViewController

/**
 *  自定义透明导航栏
 *  @param title 导航栏标题
 */
- (void)initNavBarWithTitle:(NSString *)title;

@property (nonatomic,strong)UINavigationBar *navigationBar;
@property (nonatomic,strong)UILabel *navTitle;
@property (nonatomic,strong)UINavigationItem *navItem;

/*自定义 导航栏的view + 状态栏*/
@property (nonatomic, strong) UIView *navigationView;

/*
 *  显示（YES） --（nav--下面的一根线） self.navigationBar.shadowImage = [UIImage imageNamed:@"nav_back_line"];
 *  默认 (NO)  隐藏 --（nav--下面的一根线）（self.navigationBar.shadowImage = [UIImage new];）
 */
@property (nonatomic,assign)BOOL isNav_Line;

/**
 *  导航栏透明
 */
@property (nonatomic,assign)BOOL isTransparent;

/**
 *  navigation返回按钮的tite设置
 */
- (void) navigationItem:(NSString*)backString;

/**
 *  返回按钮
 */
- (void)backAction;

@end
