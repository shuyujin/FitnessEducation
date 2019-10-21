//
//  LSNavgationViewController.m
//  WeiLingDi
//
//  Created by syyp on 16/3/1.
//  Copyright © 2016年 syyp. All rights reserved.
//

#import "LSNavgationViewController.h"
#import "LSDataService.h"

@interface LSNavgationViewController ()


@end

@implementation LSNavgationViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
//        self.navigationBarHidden = NO; // 使右滑返回手势可用
//        self.navigationBar.hidden = YES; // 隐藏导航栏
        
    }
    return self;
}

+ (instancetype)instantiationWithRootViewController:(UIViewController *)rootViewController{
    
    LSNavgationViewController *navigationController = [[LSNavgationViewController alloc] initWithRootViewController:rootViewController];
    return navigationController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.设置导航栏背景色
    self.navigationBar.barTintColor = [UIColor WLD_LeaveBlankColor];
    
    //2.设置导航栏按钮字体颜色
    self.navigationBar.tintColor = [UIColor WLD_AppIconColor];
    
    //3.设置导航栏标题颜色
    NSDictionary *titleTextAttributes = @{
                                          NSForegroundColorAttributeName:[UIColor WLD_AppIconColor],
                                          };
    self.navigationBar.titleTextAttributes = titleTextAttributes;
    
    //这个修改了融云查看图片或位置时nav的背景色
    [[UINavigationBar appearance] setBarTintColor:[UIColor WLD_LeaveBlankColor]];

    // 自带的滑动手势 开启
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    self.navigationBar.hidden = YES; // 登录注册二级页面用到。
   
}

//在导航控制器中复写preferredStatusBarStyle 设置状态栏的颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    //统一设置黑色
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end

