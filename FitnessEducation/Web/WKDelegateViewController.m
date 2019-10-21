//
//  WKDelegateViewController.m
//  WeiLingDi
//
//  Created by wld_02 on 2017/9/7.
//  Copyright © 2017年 syyp. All rights reserved.
//

#import "WKDelegateViewController.h"

@interface WKDelegateViewController ()

@end

@implementation WKDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([self.delegate respondsToSelector:@selector(userContentController:didReceiveScriptMessage:)]) {
        [self.delegate userContentController:userContentController didReceiveScriptMessage:message];
    }
}


@end
