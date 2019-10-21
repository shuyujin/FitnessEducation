//
//  WLDBaseViewController.m
//  WeiLingDing_Ipad
//
//  Created by wld on 2018/8/21.
//  Copyright © 2018年 wldIos. All rights reserved.
//

#import "WLDSBaseViewController.h"
#import "UIView+UIViewController.h"

@interface WLDSBaseViewController ()

@property (nonatomic,strong)UIButton *imageButton;
@property (nonatomic,strong)UIView *statusBarView;

@end

@implementation WLDSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navigationView];
    
    [self initNavBarWithTitle:self.title];
    
    self.automaticallyAdjustsScrollViewInsets = false;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
   
#if DEBUG
    
    UIViewController *vc = [self.view getCurrentVC];
    DNSLog(@"\n\n\n****当前的屏幕显示的ViewController-----（%s）-----\n\n\n*",object_getClassName(vc));
    
#else
    
    
#endif
    
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
   
}

- (void) navigationItem:(NSString*)backString
{
    //修改下一个页面的返回按钮的文字
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    self.navigationItem.backBarButtonItem = backItem;
    backItem.title = backString;
}

- (UIView *)navigationView{
    if (!_navigationView) {
        _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, VIEW_TOP-0.5)];
        _navigationView.backgroundColor = [UIColor WLD_LeaveBlankColor];
    }
    return _navigationView;
}

- (void)setTitle:(NSString *)title {
    
    [super setTitle:title];
    self.navTitle.text = title;
    
}

/**
 *  ***** 自定义导航栏  *****
 *  isTransparent 是否透明
 *  @param title 导航栏标题
 */
- (void)initNavBarWithTitle:(NSString *)title {
    
    if (IS_HEIGHT || ios11) {
        if (self.navigationBar == nil) {
            self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, Main_Screen_Width, VIEW_TOP-STATUSBAR_HEIGHT)];
        }
        if (self.statusBarView == nil) {
            self.statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, STATUSBAR_HEIGHT)];
        }
        [_navigationView addSubview:self.statusBarView];
        self.statusBarView.backgroundColor = [UIColor clearColor];
    }
    else {
        if (self.navigationBar == nil) {
            self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, VIEW_TOP)];
        }
    }
    
    self.navigationBar.tintColor = [UIColor WLD_AppIconColor]; // 返回按钮的颜色
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    /*
     *  显示（YES） --（nav--下面的一根线） self.navigationBar.shadowImage = [UIImage imageNamed:@"nav_back_line"];
     *  默认 (NO)  隐藏 --（nav--下面的一根线）（self.navigationBar.shadowImage = [UIImage new];）
     */
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.barTintColor = [UIColor clearColor];
    
    [_navigationView  addSubview:self.navigationBar];
    
    if (self.navItem == nil) {
        self.navItem = [[UINavigationItem alloc]init];
    }
    
    if (self.navTitle == nil) { //标题
        self.navTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 232*(Main_Screen_Width/320), 30)];
    }
    [self.navTitle setTextColor:[UIColor WLD_AppIconColor]];
    self.navTitle.textAlignment = NSTextAlignmentCenter;
    [self.navTitle setText:title];
    self.navTitle.font = [UIFont WLD_NavBoldFont];
    self.navItem.titleView = self.navTitle;
    
    self.navItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStyleDone target:nil action:@selector(backAction)];
    [self.navigationBar pushNavigationItem:self.navItem animated:YES];
}

-(void)setIsNav_Line:(BOOL)isNav_Line{
    if (_isNav_Line != isNav_Line) {
        _isNav_Line = isNav_Line;
        if (_isNav_Line) {
            self.navigationBar.shadowImage = [UIImage imageNamed:@"nav_back_line"];
        }
    }
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setIsTransparent:(BOOL)isTransparent {
    
    if (isTransparent == YES) {
        self.navTitle.alpha = 0;
        _navigationView.backgroundColor = [UIColor clearColor];
        
    }
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
