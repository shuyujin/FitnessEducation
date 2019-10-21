//
//  WKDelegateViewController.h
//  WeiLingDi
//
//  Created by wld_02 on 2017/9/7.
//  Copyright © 2017年 syyp. All rights reserved.
//

#import <WebKit/WebKit.h>


@protocol WKDelegate <NSObject>

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;

@end


@interface WKDelegateViewController : UIViewController<WKScriptMessageHandler>

@property (weak , nonatomic) id<WKDelegate> delegate;

@end
