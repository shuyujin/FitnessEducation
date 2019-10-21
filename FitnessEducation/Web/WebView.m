//
//  WebView.m
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import "WebView.h"
#import <WebKit/WebKit.h>

@interface WebView ()

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIProgressView *progressView;

@end

@implementation WebView

-(instancetype)initWithFrame:(CGRect)frame urlStr:(NSString *)urlStr {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.webView = [[WKWebView alloc] initWithFrame:frame];
        //    self.webView.navigationDelegate = self;
        //    self.webView.UIDelegate = self;
        //开了支持滑动返回
        //    self.webView.allowsBackForwardNavigationGestures = YES;
        
        self.backgroundColor = [UIColor redColor];
        self.webView.layer.cornerRadius = 10;
        self.webView.layer.masksToBounds = YES;
        [self addSubview:self.webView];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
        DNSLog(@"H5 -- %@",request);
        [self.webView loadRequest:request];
        
        
        //进度条初始化
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.webView.size.width, 2)];
        self.progressView.backgroundColor = [UIColor WLD_YellowColor];
        self.progressView.progressTintColor = [UIColor WLD_YellowColor];
        //设置进度条的高度，下面这句代码表示进度条的宽度变为原来的1倍，高度变为原来的1.5倍.
        self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
        [self.webView addSubview:self.progressView];
        
        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.progress = self.webView.estimatedProgress;
        if (self.progressView.progress == 1) {
            /*
             *添加一个简单的动画，将progressView的Height变为1.4倍，在开始加载网页的代理中会恢复为1.5倍
             *动画时长0.25s，延时0.3s后开始动画
             *动画结束后将progressView隐藏
             */
            __weak typeof (self)weakSelf = self;
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                weakSelf.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.4f);
            } completion:^(BOOL finished) {
                weakSelf.progressView.hidden = YES;
                
            }];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载网页");
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
    //开始加载网页的时候将progressView的Height恢复为1.5倍
    self.progressView.transform = CGAffineTransformMakeScale(1.0f, 1.5f);
    //防止progressView被网页挡住
    //    [self.coverView bringSubviewToFront:self.progressView];
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
    //加载完成后隐藏progressView
    //self.progressView.hidden = YES;
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败");
    //加载失败同样需要隐藏progressView
    //self.progressView.hidden = YES;
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
