//
//  JsObject.h
//  ChinaMerchants
//
//  Created by yishuhong on 2017/9/8.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>  

@protocol TestJSObjectProtocol <JSExport>

//此处我们测试几种参数的情况
-(void)getMessage;
-(void)getMessage:(NSString *)message;
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2;

@end

@interface JsObject : NSObject<TestJSObjectProtocol>


@end
