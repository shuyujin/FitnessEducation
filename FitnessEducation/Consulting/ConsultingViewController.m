//
//  ViewController.m
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import "ConsultingViewController.h"
#import "LSAlertView.h"
#import "ControlModel.h"
#import "WebView.h"

#import "MBProgressHUD+Loading.h"
#import "NSError+Reason.h"
#import "UIScrollView+Refresh.h"

#import "ClubAPI.h"
#import "ClubInformationModel.h"
#import "ClubNewsListTableCell.h"
#import "ActivityListModel.h"
#import "BaseURLAPI.h"
#import "WebController.h"

#import "WebViewController.h"
#import "LSNavgationViewController.h"


@interface ConsultingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) ClubAPI * clubAPI;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;


@end

@implementation ConsultingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"资讯";
    self.navItem.leftBarButtonItem = nil;
    self.isNav_Line = YES;
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ClubNewsListTableCell" bundle:nil] forCellReuseIdentifier:@"ClubNewsListTableCell"];
    
    self.clubAPI =[[ClubAPI alloc]init];
    
    
    [self.tableView xx_addHeaderRefreshWithBlock:^{
        [self loadData:YES];
    }];
    [self.tableView xx_addFooterRefreshWithBlock:^{
        [self loadData:NO];
    }];
    [self.tableView xx_beginRefreshing];
    
    
}

-(void)loadData:(BOOL )isF {
    
    if (isF) {
        NSDictionary * Parameters=@{@"pageNum":@(1),
                                    @"pageSize":@"100"};
        [self.clubAPI ClubInformationParameters:Parameters success:^(NSDictionary *responseDict) {
            
            self.dataArray =[NSArray yy_modelArrayWithClass:[ClubInformationModel class] json:responseDict];
            
            [self.tableView reloadData];
            
            [self.tableView xx_isHasMoreData:YES];
            
        } failure:^(NSError *error) {
            [self.tableView xx_endRefreshing];
            [MBProgressHUD showTip:[error errorMessage]];
        }];
    }
    else {
        [self.tableView xx_isHasMoreData:isF];
    }
    
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




@end
