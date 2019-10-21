//
//  NSError+Reason.m
//  mgjr
//
//  Created by Apricot on 15/9/23.
//  Copyright © 2015年 wghl. All rights reserved.
//

#import "NSError+Reason.h"

#define KDomain @"com.app.itkd"

@implementation NSError (Reason)

+ (NSError *)errorCode:(NSInteger)code message:(NSString *)message{
    if (message==nil ) {
        message=@"未知错误";
    }
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:message
                                                                       forKey:NSLocalizedFailureReasonErrorKey];
    
    [userInfo setValue:message forKey:NSLocalizedDescriptionKey];
   return [NSError errorWithDomain:KDomain code:code userInfo:userInfo];
}

+ (NSError *)errorMessage:(NSString *)message{
    if (message==nil) {
        message=@"未知错误";
    }
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:message
                                                                       forKey:NSLocalizedFailureReasonErrorKey];
    
    [userInfo setValue:message forKey:NSLocalizedDescriptionKey];
    return [NSError errorWithDomain:KDomain code:110 userInfo:userInfo];
}

- (NSString *)errorMessage{
    if(self.localizedFailureReason){
        return self.localizedFailureReason;
    }else if(self.localizedDescription){
        return self.localizedDescription;
    }
    return [NSString stringWithFormat:@"网络错误（%ld）",(long)self.code];
}

@end
