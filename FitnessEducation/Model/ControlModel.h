//
//  ControlModel.h
//  FitnessEducation
//
//  Created by wld-Janek on 2019/2/26.
//  Copyright © 2019 Janek. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ControlModel : NSObject

@property (copy, nonatomic) NSString *is_wap;

@property (copy, nonatomic) NSString *wap_url;

@property (copy, nonatomic) NSString *is_update;

@property (copy, nonatomic) NSString *update_url;

@property (copy, nonatomic) NSString *code;

@property (copy, nonatomic) NSString *msg;

@end

NS_ASSUME_NONNULL_END
