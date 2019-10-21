//
//  LSDataService.m
//
//  Created by  on 16/3/3.
//  Copyright © 2016年 syyp. All rights reserved.
//

#import "LSDataService.h"


@implementation LSDataService

static LSDataService* _instance = nil;


+ (LSDataService *)sharedUtil {
    
    static dispatch_once_t onceToken;
    static LSDataService *sharedInstance;
    
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[LSDataService alloc] init];
    });
    
    return sharedInstance;
}

// PHP 接口
+ (void)requestWithAPIURL:(NSString *)urlstring httpMethod:(NSString *)method params:(NSMutableDictionary *)params data:(NSMutableArray *)datas success:(void (^)(id, NSDictionary *))success_block failure:(void (^)(NSError *))failure_block{
    
    //1.构造操作对象管理者
    LSDSessionManager *manager = [LSDSessionManager shareManager];
    
    manager.requestSerializer.timeoutInterval = 60.0f;
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //请求类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", @"text/html", nil];

    [manager GET:urlstring parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *result =[[ NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSString *baseStr = [Utils base64decodeString:result];
        
        success_block(baseStr,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure_block (error);
    }];
}













/**
 *   混合。。。
 */
+ (void)requestWithAPIURL:(NSString *)urlstring httpMethod:(NSString *)method apiType:(API_TYPE)apiType params:(NSMutableDictionary *)params data:(NSMutableArray *)datas success:(void (^)(id, NSDictionary *))success_block failure:(void (^)(NSError *))failure_block{
    
    switch (apiType) {

        case PHP_API:
//            urlstring = [PHP_BASE_URL stringByAppendingString:urlstring];
            break;
            
        case PHP_ActivityAPI:
//            urlstring = [PHP_activity_URL stringByAppendingString:urlstring];
            break;
            
        case JAVA_API:
//            urlstring = [JAVA_USER_URL stringByAppendingString:urlstring];
            break;
            
        case JAVA_Merchants_API:
//            urlstring = [JAVA_BASE_URL stringByAppendingString:urlstring];
            break;
            
        case JAVA_BRAND_PORT:
//            urlstring = [JAVA_Brand_URL stringByAppendingString:urlstring];
            break;
     
        case UPLOAD_VIDEO:
//            urlstring = [JAVA_BASE_URL stringByAppendingString:urlstring];
            break;
            
        case PHP_SaleUrl:
//            urlstring = [SaleUrl stringByAppendingString:urlstring];
            break;
         
        case JAVA_Beverage:
//            urlstring = [JAVA_Beverage_URL stringByAppendingString:urlstring];
            
            break;
        case JAVA_Retail:
//            urlstring = [JAVA_Retail_URL stringByAppendingString:urlstring];
            break;
        case Other_API:
            // 为1000 不需要传域名(如微信第三方登录)
            break;
            
        default:
            break;
    }
    
    [self requestWithJAVAOrPHP_AFURL:urlstring httpMethod:method apiType:apiType params:params data:datas success:success_block failure:failure_block];
}

+ (void)requestWithJAVAOrPHP_AFURL:(NSString *)urlstring httpMethod:(NSString *)method apiType:(API_TYPE)apiType params:(NSMutableDictionary *)params data:(NSMutableArray *)datas success:(void (^)(id, NSDictionary *))success_block failure:(void (^)(NSError *))failure_block{
 
    //1.构造操作对象管理者
    LSDSessionManager *manager = [LSDSessionManager shareManager];
    
    manager.requestSerializer.timeoutInterval = 60.0f;
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    
    //2.设置解析格式，默认json
//    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    //申明返回的结果是json类型
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //申明请求的数据是json类型
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //请求类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", @"text/html", nil];

//    NSString * jsonString = [params yy_modelToJSONString];
//    if (jsonString.length > 0) { //jsonString不能为空，为空不进行加密
//        NSString * md5 = [Utils base64EncodeString:jsonString];
//        [manager.requestSerializer setValue:md5 forHTTPHeaderField:@"md5"];
//    }

    
    /** XIAOMI("1", "小蜜app"), ("2", "经销商app")，("3", "硬件平台")，("4","蜜购"),("5","蜜餐"),("6","蜜零") */
//    [manager.requestSerializer setValue:@"1" forHTTPHeaderField:@"channelId"];
    
//    [manager.requestSerializer setValue:[NSString stringWithFormat:@"V%@",[InfoPlist mainVersion]] forHTTPHeaderField:@"appVersion"];//app版本
//    [manager.requestSerializer setValue:GetRegistrationID ? GetRegistrationID : [JPUSHService registrationID] forHTTPHeaderField:@"deviceId"];// 极光id
//    [manager.requestSerializer setValue:@"IOS" forHTTPHeaderField:@"termTyp"];//设备类型，IOS,Android
//    [manager.requestSerializer setValue:KEY_VAVLUE(userInfoDic[@"openid"]) forHTTPHeaderField:@"GID"];//登录唯一标识
//    [manager.requestSerializer setValue:[InfoPlist systemVersion] forHTTPHeaderField:@"osVersion"];//设备系统版本
    
    //3.判断网络状况
    AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
    [netManager startMonitoring];  //开始监听
    [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        
        if (status == AFNetworkReachabilityStatusUnknown) { //未知网络
            
//            [Utils sharedUtil].AFNStatus = @"未知网络";
//            DNSLog(@"———————————未知网络————————————");
            
        }else if (status == AFNetworkReachabilityStatusNotReachable){ //没有网络(断网)
            
//            if (![Utils sharedUtil].promptOnce) {
//
//                LSAlertView *alertView = [[LSAlertView alloc]initWithTitle:@"提示" message:@"网络链接错误,请检查网络链接" cancleBtn:nil sureBtn:@"我知道了"];
//                [alertView show];
//
//                [Utils sharedUtil].promptOnce = YES;
//
//                DNSLog(@"————————————断网——————————————");
//            }
            
            [[LSDataService sharedUtil].delegate hideHUD];
//            [GiFHUD dismiss];
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWWAN){  //手机自带网络
            
//            [Utils sharedUtil].promptOnce = NO;
//            [Utils sharedUtil].AFNStatus = @"4G/3G";
//            DNSLog(@"——————————手机自带网络——————————");
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi){  //WIFI
            
//            [Utils sharedUtil].promptOnce = NO;
//            [Utils sharedUtil].AFNStatus = @"wifi";
            DNSLog(@"————————————WI-FI————————————");
        }
    }];
    
    
    if ([[method uppercaseString] isEqualToString:@"GET"]) {
        /**
         *  @param downloadProgress 这里可以获取到目前的数据请求的进度
         */
        [manager GET:urlstring parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         
           
            NSString *result =[[ NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            
//            NSDictionary * allHeaders  =response.allHeaderFields;
//            success_block(responseObject,allHeaders);
       
            // 弹登录界面和错误信息
            [LSDataService LoginRegistController:responseObject[@"code"] message:nil];

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        
            failure_block (error);
            
            // 弹登录界面和错误信息
            [LSDataService LoginRegistController:@"接口不通" message:[error.userInfo objectForKey:@"NSLocalizedDescription"]];
        }];
        
    }else if([[method uppercaseString] isEqualToString:@"POST"]){
        
        if (datas.count>0) {
            
            [manager POST:urlstring parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                
                if (apiType == UPLOAD_VIDEO) {
                    
                    NSData *imageData = datas[0];
                    // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
                    // 要解决此问题，
                    // 可以在上传时使用当前的系统事件作为文件名
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    formatter.dateFormat = @"yyyyMMddHHmmss";
                    NSString *str = [formatter stringFromDate:[NSDate date]];
                    //                    NSString *name = [NSString stringWithFormat:@"image_%d", i];
                    NSString *fileName = [NSString stringWithFormat:@"%@.mp4", str];
                    //将得到的二进制图片拼接到表单中 /** data,指定上传的二进制流;name,服务器端所需参数名*/
                    //V4.0图片上传
                    [formData appendPartWithFileData:imageData name:@"files" fileName:fileName mimeType:@"video/mp4"];
                    
                }else{
                    
                    for (int i = 0 ; i < datas.count; i++){
                        NSData *imageData = datas[i];
                        // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
                        // 要解决此问题，
                        // 可以在上传时使用当前的系统事件作为文件名
                        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                        formatter.dateFormat = @"yyyyMMddHHmmss";
                        NSString *str = [formatter stringFromDate:[NSDate date]];
                        //                    NSString *name = [NSString stringWithFormat:@"image_%d", i];
                        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
                        
                        //将得到的二进制图片拼接到表单中 /** data,指定上传的二进制流;name,服务器端所需参数名*/
                        
                        //V4.0图片上传
                        [formData appendPartWithFileData:imageData name:@"files" fileName:fileName mimeType:@"image/png"];
                    }
                }
                
            } progress:^(NSProgress * _Nonnull uploadProgress) {
                
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary * allHeaders  =response.allHeaderFields;
                success_block(responseObject,allHeaders);
                
                // 弹登录界面和错误信息
                [LSDataService LoginRegistController:responseObject[@"code"] message:nil];

#ifdef DEBUG
                // 调试
//                NSString *josn = [response mj_JSONString];
//                DNSLog(@"++++++++++++++\n加密头部请求数据\n%@\n接口返回数据格式\n\n%@ \n URL:%@\n\n",allHeaders,josn,urlstring);
#endif
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failure_block (error);
                
                // 弹登录界面和错误信息
                [LSDataService LoginRegistController:@"接口不通" message:[error.userInfo objectForKey:@"NSLocalizedDescription"]];

            }];
            
        }else{

            [manager POST:urlstring parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                // 返回请求头部信息  GID
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary * allHeaders  =response.allHeaderFields;
                success_block(responseObject,allHeaders);
                
                // 弹登录界面和错误信息
                [LSDataService LoginRegistController:responseObject[@"code"] message:nil];
                
#ifdef DEBUG
                // 调试
//                NSString *josn = [responseObject mj_JSONString];
//                DNSLog(@"++++++++++++++\n加密头部请求数据\n%@\n接口返回数据格式\n\n%@ \n URL:%@\n\n",allHeaders,josn,urlstring);

 #endif

                

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

                failure_block(error);
                
                // 弹登录界面和错误信息
                [LSDataService LoginRegistController:@"接口不通" message:[error.userInfo objectForKey:@"NSLocalizedDescription"]];
                
            }];
        }
    }
}

// 弹登录界面和错误信息
+(void)LoginRegistController:(NSString *)loginRegis message:(NSString *)message {
    
//    loginRegis = [NSString stringWithFormat:@"%@",loginRegis];
//    if ([loginRegis isEqualToString:Re_Login]) {
//
//        [Utils alertShow:Re_Login andMessage:message present:(UIViewController *)self];
//
//    }else if([loginRegis isEqualToString:@"接口不通"]){
//
//        [Utils alertShow:nil andMessage:message present:nil];
//
//    }
//    [GiFHUD dismiss];
    
    [[LSDataService sharedUtil].delegate errorEndTableView_Mj_View];
    
}


@end
