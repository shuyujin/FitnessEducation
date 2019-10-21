//
//  LSDataService.h
//
//  Created by  on 16/3/3.
//  Copyright © 2016年 syyp. All rights reserved.
//


#import <Foundation/Foundation.h>
//#import "AFNetworking.h"
#import "LSDSessionManager.h"

typedef NS_ENUM(NSUInteger, API_TYPE) {
    
    PHP_API = 0,
    PHP_ActivityAPI = 1,
    
    JAVA_API = 2,
    JAVA_Merchants_API = 3,
    
    JAVA_BRAND_PORT = 4,
    
    UPLOAD_VIDEO = 6,
    
    PHP_MapAPI = 7,
    
    PHP_SaleUrl = 8,
    
    
    JAVA_Beverage = 12,
    
    JAVA_Retail = 13,
    
    Other_API = 1000, // 为1000 不需要传域名(如微信第三方登录)
};

typedef void (^successBlock) (id response);
typedef void (^failureBlock) (NSError *error);

@protocol LSDataServiceDelegate <NSObject>

- (void)errorEndTableView_Mj_View;

- (void)hideHUD;

@end

@interface LSDataService : NSObject

@property (nonatomic,weak)id<LSDataServiceDelegate> delegate;

+ (LSDataService *)sharedUtil;

// PHP 接口
+ (void)requestWithAPIURL:(NSString *)urlstring httpMethod:(NSString *)method params:(NSMutableDictionary *)params data:(NSMutableArray *)datas success:(void (^)(id, NSDictionary *))success_block failure:(void (^)(NSError *))failure_block;


/**
 4.0统一接口

 @param urlstring URL
 @param method get or Post
 @param apiType YES（PHP）  NO（JAVA）
 @param params 请求参数
 @param datas 请求文件(图片)
 @param success_block 请求成功的block
 @param failure_block 请求失败的block
 */
+ (void)requestWithAPIURL:(NSString *)urlstring
               httpMethod:(NSString *)method
                   apiType:(API_TYPE)apiType
                   params:(NSMutableDictionary *)params
                     data:(NSMutableArray *)datas
                  success:(void (^)(id result,NSDictionary * allHeaderDic))success_block
                  failure:(void (^)(NSError *error))failure_block;






@end
