//
//  UIImageView+Load.m
//  WYWProject
//
//  Created by Apricot on 2017/7/10.
//  Copyright © 2017年 Apricot. All rights reserved.
//

#import "UIImageView+Load.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (Load)

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.masksToBounds =YES;
        self.contentMode =UIViewContentModeScaleAspectFill;
    }
    return self;
}


- (void)xx_setImageWithURLStr:(NSString *)imageURLStr placeholder:(UIImage *)placeholder{
//#warning 需要判断是不是使用的七牛的图片
    NSURL *imageUrl = nil;
//    if([imageURLStr rangeOfString:@"image.xiaxiangke.com"].location != NSNotFound){
//        NSString * params = [NSString stringWithFormat:@"?imageView2/0/w/%0.0f/h/%0.0f",self.bounds.size.width*2,self.bounds.size.height*2];
//        //        NSString * params = [NSString stringWithFormat:@"?imageView2/0/w/%0.0f",self.bounds.size.width*2];
//        
//        
//        //        NSString *params = @"?imageslim";
//        imageUrl = [NSURL URLWithString:[imageURLStr stringByAppendingString:params]];
//        NSLog(@"ImageURL:::>>>%@",imageUrl.absoluteString);
//    }else{
//    }
//    //    if(!placeholder){
//    //        placeholder = [UIImage imageNamed:@"vp _destination_playList_Iamge"];
//    //    }
    
    if(!placeholder){
        placeholder = [UIImage imageNamed:@"zhengfangxing_800x800"];
    }
    
    if(![imageURLStr hasPrefix:@"http"]){
        UIImage *image = [UIImage imageNamed:imageURLStr];
        if(!image){
            image = placeholder;
        }
        self.image = image;
        return;
    }
    imageUrl = [NSURL URLWithString:imageURLStr];
    
    if(!imageUrl){
        imageUrl = [NSURL URLWithString:@""];
    }
    
    [self sd_setImageWithURL:imageUrl placeholderImage:placeholder];
}
- (void)xx_setImageWithURLStr:(NSString *)imageURLStr{
    [self xx_setImageWithURLStr:imageURLStr placeholder:nil];
}

@end
