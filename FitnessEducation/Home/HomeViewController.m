//
//  ViewController.m
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import "HomeViewController.h"
#import "LSAlertView.h"
#import "ControlModel.h"
#import "WebView.h"
#import "UIScrollView+Refresh.h"

#import "ClubAPI.h"
#import "ClubInformationModel.h"
#import "ClubNewsListTableCell.h"
#import "ActivityListModel.h"
#import "BaseURLAPI.h"
#import "WebController.h"

#import "WebViewController.h"
#import "LSNavgationViewController.h"
#import "MBProgressHUD+Loading.h"


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) ClubAPI * clubAPI;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.title = @"首页";
//    self.navItem.leftBarButtonItem = nil;
//    self.isNav_Line = YES;
//
//
//    [self.tableView registerNib:[UINib nibWithNibName:@"ClubNewsListTableCell" bundle:nil] forCellReuseIdentifier:@"ClubNewsListTableCell"];
//
//    self.clubAPI =[[ClubAPI alloc]init];
    
    
    
//    LSAlertView *alerView = [[LSAlertView alloc] initWithTitle:@"白包测试接口" message:nil cancleBtn:nil sureBtn:@"确定"];
//    WEAKSELF;
//    alerView.resultIndex = ^(NSInteger index) {
//        STRONGSELF;
//
//        [strongSelf loadApi];
//    };
//
//    [alerView show];
}


-(void)loadData {
    NSDictionary * Parameters=@{@"pageNum":@(1),
                                @"pageSize":@"100"};
    [self.clubAPI ClubInformationParameters:Parameters success:^(NSDictionary *responseDict) {
        
        self.dataArray =[NSArray yy_modelArrayWithClass:[ClubInformationModel class] json:responseDict];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ClubNewsListTableCell * cell =[tableView dequeueReusableCellWithIdentifier:@"ClubNewsListTableCell"];
    ClubInformationModel * informationModel =self.dataArray[indexPath.row];
    [cell xx_configCellWithEntity:informationModel];
    
    return cell;
}

#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 116;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * urlString =[BaseURLAPI stringByAppendingString:@"web/newinfo"];
    ClubInformationModel * informationModel =self.dataArray[indexPath.row];
    WebController * webController =[WebController instantiation];
    webController.title =informationModel.title;
    webController.webId =informationModel.newsId;
    webController.urlString =[NSString stringWithFormat:@"%@?newsId=%@",urlString,informationModel.newsId];
    webController.comeFromType =WebComeFromNewsType;
    webController.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:webController animated:YES];
    
}

#pragma mark -setter or getter
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, VIEW_TOP+1, self.view.bounds.size.width, self.view.bounds.size.height-VIEW_TOP+1) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource =self;
        _tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        _tableView.backgroundColor =[UIColor WLD_BG_GRAY];
        _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView=[UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


- (void)loadApi {
    [MBProgressHUD showLoading];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"app_id"] = @"2634629368";
    [LSDataService requestWithAPIURL:@"https://ioss.gg-app.com/back/api.php" httpMethod:@"GET" params:params data:nil success:^(id result, NSDictionary *allHeaderDic) {
       [MBProgressHUD hide];
        
        //首先判断is_update:
        //true -> 强更，下载update_url中的apk，执行强更，安装apk
        //false -> 不强更，判断is_wap, 如果is_wap = true，那么跳转wap_url，如果is_wap = false，不跳转，进入壳的内容
        
        ControlModel * cModel = [ControlModel yy_modelWithJSON:result];
        
        WebViewController *web = [[WebViewController alloc]initWithWebURL:cModel.wap_url andType:1];
//        LSNavgationViewController *nav = [[LSNavgationViewController alloc]initWithRootViewController:web];
        [self presentViewController:web animated:NO completion:nil];

        
        if ([cModel.is_update isEqualToString:@"0"]) {//NO
            
        }
        else {
            if ([cModel.is_wap isEqualToString:@"1"]) {//YES
                
            }
        }

    } failure:^(NSError *error) {
        DNSLog(@"%@",error);
        [MBProgressHUD hide];
    }];
}


@end
