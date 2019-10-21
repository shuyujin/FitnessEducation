//
//  JsObject.m
//  ChinaMerchants
//
//  Created by yishuhong on 2017/9/8.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "JsObject.h"

@implementation JsObject

//一下方法都是只是打了个log 等会看log 以及参数能对上就说明js调用了此处的iOS 原生方法
-(void)getMessage
{
    NSLog(@"this is ios TestNOParameter");
}
-(void)getMessage:(NSString *)message
{
    NSLog(@"this is ios TestOneParameter=%@",message);
}
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2
{
    NSLog(@"this is ios TestTowParameter=%@  Second=%@",message1,message2);
}

@end
