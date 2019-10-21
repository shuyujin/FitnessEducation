//
//  MyViewController.m
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import "MyViewController.h"
//#import "LoginController.h"
#import "UserManager.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    self.navItem.leftBarButtonItem = nil;
    self.isNav_Line = YES;
 
//    if ([UserManager sharedInstance].xx_userinfoID.length<1) {
//        UIViewController * loginController =[LoginController instantiation];
//        [self presentViewController:loginController animated:YES completion:nil];
//        return;
//    }
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
