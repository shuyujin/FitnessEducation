//
//  TabbarViewController.m
//  WeiLingDi
//
//  Created by syyp on 16/4/7.
//  Copyright © 2016年 syyp. All rights reserved.
//

#import "TabbarViewController.h"



@interface TabbarViewController ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, assign) NSInteger timeDown;

@end

@implementation TabbarViewController

+ (instancetype)instantiation
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([self class])];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ***** 后台替换 启动页 *****  // 为 YES 返回首页 -- 未登录的情况下点击关闭 -- 防止再次加载启动页
//    setLaunchImgUrl(@"https://img.weilingdi.com/Uploads/header/2018-02-08/5a7bf585e1a33.jpg");

    self.tabBar.backgroundImage = [UIImage new];
    self.tabBar.shadowImage = [UIImage new];
    
    self.tabBar.barStyle = UIBarStyleDefault;
    self.tabBar.translucent = NO;
    
    self.selectedIndex = 1;
    
    [self setTabbarSelectImage:self type:1];
}

/**- tag : 10 工作台 11 消息 12 资讯 13 我的 ---**/

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    
    self.tabBar.backgroundImage = [UIImage new];
    self.tabBar.shadowImage = [UIImage new];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    // 选中 （10 工作台 11 消息 12 资讯 13 我的 ） 另外一套
    [self setTabbarSelectImage:self type:1];
}


/**
 *  设置tabbar选中时的图片和字体颜色(storyboard情况下)
 *  type ： 0 默认首页4个不一样的tab图标  1 选择的样子  （共两套）
 *  @param tabBarController tabBarController
 */
- (void)setTabbarSelectImage:(UITabBarController *)tabBarController type:(NSInteger)type  {
    
    for (UITabBarItem *item in tabBarController.tabBar.items) {
      
        UIImage *selectedImage;
        UIImage *images;
        UIColor *color = [UIColor WLD_AppIconColor];
        if (item.tag == 10) {
            
            selectedImage = [UIImage imageNamed:@"tab_wudaoguan_sel"];
            images = [UIImage imageNamed:@"tab_wudaoguan_nor"];
            
        }
        else if (item.tag == 11) {
            
            selectedImage = [UIImage imageNamed:@"tab_dongtai_sel"];
            images = [UIImage imageNamed:@"tab_dongtai_nor"];
            
        }
        else if (item.tag == 12) {
            
                selectedImage = [UIImage imageNamed:@"tab_wode_sel"];
                images = [UIImage imageNamed:@"tab_wode_nor"];
            
        }
//        else{
//
//
//                selectedImage = [UIImage imageNamed:@"bottom_icon_my_selected"];
//                images = [UIImage imageNamed:@"bottom_icon_my_normal"];
//
//        }
        
        // 改变他的按钮图片 自定义
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:color} forState:UIControlStateSelected];
        item.image = [images imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

- (void)createLaunchView {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
