//
//  WebController.mController
//  ChinaMerchants
//
//  Created by JK on 2017/8/4.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "WebController.h"
#import "WebViewModel.h"
#import "UserManager.h"
#import "UserInfoModel.h"
#import "YYModel.h"
#import "JsObject.h"
#import "ClassAPI.h"
#import "MBProgressHUD+Loading.h"
#import "NSError+Reason.h"
#import "QMCalendarFunction.h"
#import "VPShareManage.h"

@interface WebController ()<UIWebViewDelegate>

@property (nonatomic, strong) WebViewModel *viewModel;

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) ClassAPI * classAPI;

@property (nonatomic, strong) UIBarButtonItem * sharButtonItem;

@end

@implementation WebController

+ (instancetype)instantiation{
    return [[WebController alloc]init];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hidesBottomBarWhenPushed = YES;
    
    self.navItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStyleDone target:nil action:@selector(actionBack)];

    
    self.classAPI =[[ClassAPI alloc]init];
    self.webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, VIEW_TOP, self.view.bounds.size.width, self.view.bounds.size.height-VIEW_TOP)];
    self.webView.delegate =self;

    [self.view addSubview:self.webView];
    
    if (self.comeFromType ==WebComeFromAddGrowthRecord) {
        self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submitAction)];
        UserInfoModel * userInfoModel =[UserManager sharedInstance].xx_userInfo;
        ClubUserModel *clubUser =userInfoModel.clubUser;
        if ([clubUser.role isEqualToString:@"2"]||[clubUser.role isEqualToString:@"3"]) {
            [self pathForResource:@"scrob"];
        }else{
          
            [self pathForResource:@"scroa"];
        }
    }else if (self.comeFromType ==WebComeFromLookGrowthRecord){
            [self pathForResource:@"scroc"];
    }else{
        if (self.comeFromType==WebComeFromActivityType||self.comeFromType==WebComeFromNewsType) {
            self.navigationItem.rightBarButtonItem=self.sharButtonItem;
        }
        NSURL * url =[NSURL URLWithString:self.urlString];
        NSURLRequest * request =[NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
    
//    switch (self.comeFromType) {
//        case WebComeFromprotocolType:{
//            //学习
//
//        }break;
//        case WebComeFromActivityType||WebComeFromNewsType:{
//            self.webView.delegate =self;
//            NSURL * url =[NSURL URLWithString:self.urlString];
//            NSURLRequest * request =[NSURLRequest requestWithURL:url];
//            [self.webView loadRequest:request];
//        }break;
//        case WebComeFromUsMeType:{
//            NSURL * url =[NSURL URLWithString:self.urlString];
//            NSURLRequest * request =[NSURLRequest requestWithURL:url];
//            [self.webView loadRequest:request];
//        }break;
//        case WebComeFromshoppingMallType:{
//            self.webView.delegate =self;
//            NSURL * url =[NSURL URLWithString:self.urlString];
//            NSURLRequest * request =[NSURLRequest requestWithURL:url];
//            [self.webView loadRequest:request];
//        }break;
//        default:
//            break;
//    }
}
-(void)pathForResource:(NSString *)pathForResource{

    NSString * path =[[NSBundle mainBundle] bundlePath];
    NSURL *baseURL =[NSURL fileURLWithPath:path];
    NSString * htmlPath =[[NSBundle mainBundle]pathForResource:pathForResource ofType:@"html"];
    NSString * htmlCont =[NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];
}

-(void)submitAction{
    
    NSString *coachInfo = [self.webView stringByEvaluatingJavaScriptFromString:@"setData();"];
        NSLog(@"JS返回值：%@",coachInfo);
    UserInfoModel * userInfoModel =[UserManager sharedInstance].xx_userInfo;
    ClubUserModel * clubUserModel =userInfoModel.clubUser;
    NSMutableDictionary *parameters =[NSMutableDictionary dictionary];
    parameters[@"uId"]=[UserManager sharedInstance].xx_userinfoID;
    parameters[@"clubId"]=clubUserModel.clubId;
    parameters[@"clubUId"]=clubUserModel.clubUId;
    parameters[@"clubGroupId"]=self.growthRecordModel.clubGroupId;
    parameters[@"groupMemberId"]=self.growthRecordModel.groupMemberId;
    parameters[@"growthRecordId"]=self.growthRecordModel.growthRecordId;
    if ([clubUserModel.role isEqualToString:@"2"]||[clubUserModel.role isEqualToString:@"3"]) {
        parameters[@"coachInfo"]=coachInfo;
    }else{
        parameters[@"parentInfo"]=coachInfo;
    }
    [self.classAPI AddGrowthRecordParameters:parameters success:^(NSDictionary *responseDict) {
        [self.navigationController popViewControllerAnimated:YES];
        if (self.tappenBlock) {
            self.tappenBlock();
        }
    } failure:^(NSError *error) {
        [MBProgressHUD showTip:[error errorMessage]];
    }];
    
}

- (void)actionBack{

//    if ([self.webView canGoBack]) {
//        [self.webView goBack];
//    }else{

        [self.navigationController popViewControllerAnimated:YES];
//    }
}


#pragma mark -UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始");
    if (self.comeFromType ==WebComeFromLookGrowthRecord) {
        UserInfoModel * userInfoModel =[UserManager sharedInstance].xx_userInfo;
        ClubUserModel * clubUserModel =userInfoModel.clubUser;
        NSMutableDictionary *parameters =[NSMutableDictionary dictionary];
        parameters[@"uId"]=[UserManager sharedInstance].xx_userinfoID;
        parameters[@"clubId"]=clubUserModel.clubId;
        parameters[@"clubUId"]=clubUserModel.clubUId;
//        parameters[@"clubGroupId"]=self.growthRecordModel.clubGroupId?self.comeFromType.clubGroupId:@"";
        parameters[@"groupMemberId"]=self.growthRecordModel.groupMemberId?self.growthRecordModel.groupMemberId:@"";
        parameters[@"growthRecordId"]=self.growthRecordModel.growthRecordId?self.growthRecordModel.growthRecordId:@"";
        [self.classAPI LookGrowthRecordParameters:parameters success:^(NSDictionary *responseDict) {
          NSString *json =[responseDict yy_modelToJSONString];
          [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"setVal(%@)",json]];
        } failure:^(NSError *error) {
            [MBProgressHUD showTip:[error errorMessage]];
        }];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

    if (self.comeFromType ==WebComeFromAddGrowthRecord) {
//        UserInfoModel * userInfoModel =[UserManager sharedInstance].xx_userInfo;
//        ClubUserModel *clubUser =userInfoModel.clubUser;
        QMCalendarFunction * calendarFunction =[[QMCalendarFunction alloc]init];
//        if ([clubUser.role isEqualToString:@"2"]||[clubUser.role isEqualToString:@"3"]) {
        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"getData(%@,%@)",[calendarFunction nowYearMoney:@"yyyy-MM-dd"],self.webId]];
//        }
    }
    NSLog(@"结束");

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"失败");
}

-(void)sharAction{
    
    UserInfoModel * userInfoModel =[[UserManager sharedInstance] xx_userInfo];
    if (userInfoModel.clubUser) {
        [VPShareManage getShareWebPageToPlatform:DDChannelTypeDynamicDetail title:self.title descr:self.title shareUrl:self.urlString thumImage:@""];
    }else{
        [MBProgressHUD showTip:@"您暂未加入俱乐部"];
    }
    
}



-(UIBarButtonItem *)sharButtonItem{
    
    if (!_sharButtonItem) {
        
        UIImage * image =[[UIImage imageNamed:@"dongtai_share"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _sharButtonItem =[[UIBarButtonItem alloc]initWithImage:image  style:UIBarButtonItemStylePlain target:self action:@selector(sharAction)];
    }
    return _sharButtonItem;
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
