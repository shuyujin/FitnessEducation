//
//  WebViewController.m
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "WKDelegateViewController.h"


@interface WebViewController ()<WKDelegate,WKNavigationDelegate,UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,strong) NSString *urlStr;

@property (nonatomic,assign)NSInteger type;

@end

@implementation WebViewController

- (id)initWithWebURL:(NSString *)urlString andType:(NSInteger)type {
    
    self = [super init];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        
        self.hidesBottomBarWhenPushed = YES;
        
        self.urlStr = urlString;
        self.type = type;
        
        //设置缓存的请求策略和超时时间
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
        
#ifdef DEBUG
        DNSLog(@"--- h5 --- 链接 /n URL %@ -----",request);
#endif
        
        [self.webView loadRequest:request];
        
        
    }
    return self;
}
-(void)dealloc{
    
    [self.webView.configuration.userContentController removeScriptMessageHandlerForName:@"AppModel"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kLoginResult_notice" object:nil];
    
    
    self.webView.UIDelegate = nil;
    self.webView.navigationDelegate = nil;
    self.webView.scrollView.delegate = nil;
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

//设置状态栏背景颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self setStatusBarBackgroundColor:[UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1]];
    
    
    if (@available(iOS 11.0, *)) {
        
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.allowsInlineMediaPlayback = YES;
    
    // 手机上要可以播放, 发出声音的话, 必须将这个属性设置为YES（⚠️是有区分系统的）
    if (@available(iOS 10.0, *)) {
        config.mediaTypesRequiringUserActionForPlayback = false;
    } else {
        config.requiresUserActionForMediaPlayback = false;
    }
    
    // 设置偏好设置
    config.preferences = [[WKPreferences alloc] init];
    // 默认为0
    config.preferences.minimumFontSize = 10;
    // 默认认为YES
    config.preferences.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示不能自动通过窗口打开
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    
    // web内容处理池
    config.processPool = [[WKProcessPool alloc] init];
    
    //注册方法
    WKDelegateViewController * delegateController = [[WKDelegateViewController alloc]init];
    delegateController.delegate = self;
    
    // 通过JS与webview内容交互
    config.userContentController = [[WKUserContentController alloc] init];
    
    // 注入JS对象名称AppModel，当JS通过AppModel来调用时，
    // 我们可以在WKScriptMessageHandler代理中接收到
    [config.userContentController addScriptMessageHandler:delegateController name:@"AppModel"];
    
    WKWebView *wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height) configuration:config];
    wkWebView.navigationDelegate = self;
    wkWebView.scrollView.delegate = self;
    wkWebView.allowsBackForwardNavigationGestures = YES;
    wkWebView.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:wkWebView];
    
    self.webView = wkWebView;
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    //    [self.webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    
    // KVO 监听属性改变
    /*
     Observer: 观察者
     KeyPath: 观察webView哪些属性
     options: NSKeyValueObservingOptionNew: 观察他的新的值的改变
     
     KVO注意点: 一定要移除
     */
    //     [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:&PrivateKVOContext];
    
    // 添加进入条
    self.progressView = [[UIProgressView alloc] init];
    self.progressView.frame = CGRectMake(0, Main_Screen_Height-2.5, Main_Screen_Width, 2.5);
    [self.view addSubview:self.progressView];
    self.progressView.progressTintColor = [UIColor WLD_YellowColor];
    self.progressView.layer.shadowOffset = CGSizeMake(1, 1);
    self.progressView.layer.shadowOpacity = 0.8;
    self.progressView.layer.shadowColor = [UIColor WLD_YellowColor].CGColor;
    
}


//#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        // 这里写相关的观察代码
        self.progressView.progress = self.webView.estimatedProgress;
        
        if (self.progressView.progress == 1.0) {
            
            [UIView animateWithDuration:0.5 animations:^{
                self.progressView.alpha = 0;
            }];
        }
    }else if ([keyPath isEqualToString:@"title"]){
        if (object == self.webView){
            self.title = self.webView.title;
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - WKNavigationDelegate

/// 是否允许加载网页 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    //    NSString *hostname = navigationAction.request.URL.host.lowercaseString;
    
//    NSString *urlStr = [NSString stringWithFormat:@"%@",navigationAction.request.URL];
    
    if (navigationAction.navigationType == WKNavigationTypeLinkActivated) {
        // 对于跨域，需要手动跳转
//        [[UIApplication sharedApplication] openURL:navigationAction.request.URL];

        // 不允许web内跳转
        decisionHandler(WKNavigationActionPolicyAllow);
    } else {
    
        self.progressView.alpha = 1.0;
        
        decisionHandler(WKNavigationActionPolicyAllow|WKNavigationActionPolicyCancel);
        
    }
}

/*
 *开始加载WKWebView时调用的方法   Home/Login/index
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation { // 类似UIWebView的 -webViewDidStartLoad:
    
    self.webView.hidden = NO;
}

// 页面内容到达main frame时回调
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

/*
 *结束加载WKWebView时调用的方法 // 类似 UIWebView 的 －webViewDidFinishLoad:
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    self.webView.hidden = NO;
    
}

/*
 *加载WKWebView失败时调用的方法
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    if (error.code == NSURLErrorCancelled) {
        
        return;
    }
    
    
}


- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController
didReceiveScriptMessage:(WKScriptMessage *)message
{
    
}


//js的alert弹出要调用
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

/*    js端调用confirm 函数时，会触发此方法
 *    通过message 可以拿到js端所传的数据
 *    在iOS端显示原生alert得到yes或no
 *    通过completionHandler回调给js端
 */
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler
{
    DNSLog(@"%s", __FUNCTION__);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"confirm" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
    
    DNSLog(@"%@", message);
}


#pragma mark --- 禁止侧滑返回  |//不能测滑 YES -- 能 NO

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
   
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return NO;
}


@end

