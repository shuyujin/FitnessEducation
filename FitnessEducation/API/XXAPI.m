//
//  XXAPI.m
//  ChinaMerchants
//
//  Created by JK on 2017/8/2.
//  Copyright © 2017年 iOS JK. All rights reserved.
//

#import "XXAPI.h"
#import "Utils.h"
#import "BaseModel.h"
#import "AFNetworking.h"
#import "BaseURLAPI.h"
#import "InfoPlist.h"
#import "YYModel.h"
#import "NSError+Reason.h"


@implementation XXAPI

-(void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(Success)success failure:(Failure)failure{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    //2.设置解析格式，默认json
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    NSString * urlString =[BaseURLAPI stringByAppendingString:URLString];
    BaseModel * baseModel =[[BaseModel alloc]init];
    baseModel.sys =@"1";
    baseModel.deviceId =[InfoPlist deviceID];
    NSDictionary *baseDic =[baseModel yy_modelToJSONObject];
    NSMutableDictionary * mutableDic =[[NSMutableDictionary alloc]init];
    [mutableDic addEntriesFromDictionary:baseDic];
    [mutableDic addEntriesFromDictionary:parameters];
    baseModel.sign = [self paramenters:mutableDic];
    mutableDic[@"sign"]=baseModel.sign;
    [manager POST:urlString parameters:mutableDic progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError * error =nil;
        if ([responseObject[@"code"] integerValue]==1000) {
            success(responseObject);
        }else{
            error =[NSError errorCode:[responseObject[@"code"] integerValue] message:responseObject[@"msg"]];
            failure(error);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

/**
 参数加密

 @param paramenters 参数
 @return <#return value description#>
 */
-(NSString *)paramenters:(NSDictionary *)paramenters{

    NSMutableArray * parameterArr =[NSMutableArray array];
    NSString * parameterString =@"";
    NSArray *keysArray = [paramenters allKeys];
    //遍历字典所有key 拼接成字符串
    for (int i=0; i<keysArray.count; i++) {
        NSString * key =keysArray[i];
        NSString * value =paramenters[key];
        parameterString =[NSString stringWithFormat:@"%@=%@&",key,value];
        [parameterArr addObject:parameterString];
    }
    //排序(升序)
    NSArray * sortResult =[parameterArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2]; //升序
    }];
    
    //排序后的参数拼接
    NSString * md5String=@"";
    for (NSString * sortString in sortResult) {
        md5String =[NSString stringWithFormat:@"%@%@",md5String,sortString];
    }
    NSString * stringMd5 =[NSString stringWithFormat:@"%@key=%@",md5String,@"E183D686D9BF85C78AA6AA644CDB34C8"];
    //参数md5加密
    NSString * string =[Utils MD5:stringMd5];
    return string;
}

@end
