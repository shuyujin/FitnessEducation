//
//  VPShareManage.m
//  VillagePlay
//
//  Created by  JK on 16/10/17.
//  Copyright © 2016年 Apricot. All rights reserved.
//

#import "VPShareManage.h"
#import <UMSocialCore/UMSocialCore.h>
#import "QMShareUIManager.h"

@implementation VPShareManage

+(instancetype)sharedinstance{
    
    static id sharedinstance =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedinstance =[[self alloc]init];
    });
    return sharedinstance;
}

+(void)getShareWebPageToPlatform:(VPChannelType)platform title:(NSString *)title descr:(NSString *)descr shareUrl:(NSString *)shareUrl thumImage:(id)thumImage{

    __weak typeof(self) weakSelf = self;
    [QMShareUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType) {
        [weakSelf shareWebPageToPlatformType:platformType channelType:platform title:title descr:descr shareUrl:shareUrl thumImage:thumImage];
    }];
}




//网页分享
+(void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType channelType:(VPChannelType)channelType title:(NSString *)title descr:(NSString *)descr shareUrl:(NSString *)shareUrl thumImage:(id)thumImage{
    
    UMShareWebpageObject *shareWebpageObject= nil;
    switch (channelType) {
        case VPChannelTypeAPP:{
            
            shareWebpageObject = [VPShareManage
                                  shareWebPageObjectWithTitle:title
                                  descr:descr
                                  thumImage:[UIImage imageNamed:@"shouye_icon"]
                                  shareUrl:shareUrl];
        }break;
        case DDChannelTypeDynamicDetail:{
            shareWebpageObject = [VPShareManage
                                  shareWebPageObjectWithTitle:title
                                  descr:descr
                                  thumImage:[UIImage imageNamed:@"shouye_icon"]
                                  shareUrl:shareUrl];
        }break;
        case DDChannelTypeDynamicList:{
            shareWebpageObject = [VPShareManage
                                  shareWebPageObjectWithTitle:title
                                  descr:descr
                                  thumImage:[UIImage imageNamed:@"shouye_icon"]
                                  shareUrl:shareUrl];
        }break;
        default:
            break;
    }
    UMSocialMessageObject * messageObject = [VPShareManage messageObjectWithShareObject:shareWebpageObject];
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                NSLog(@"response message is %@",resp.message);
                //第三方原始返回的数据
                NSLog(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                NSLog(@"response data is %@",data);
            }
        }
        [VPShareManage alertWithError:error];
    }];
}

+ (void)alertWithError:(NSError *)error
{
    NSString *result = nil;
    if (!error) {
        result = [NSString stringWithFormat:@"分享成功"];
    }
    else{
        if (error) {
            if (error.code==2009) {
//                result = [NSString stringWithFormat:@"分享失败: %d\n",(int)error.code];
                result = @"取消分享";
            }
        }
        else{
            result = [NSString stringWithFormat:@"取消分享"];
        }
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:NSLocalizedString(@"确定", @"确定")
                                          otherButtonTitles:nil];
    [alert show];
}

/**
 *  获取分享的网址的主体链接
 *
 *  @return 网址链接
 */
+(NSString *)getURL{
    return @"http://m.xiaxk.com/index.php/mobile/ShareV5/";
}


- (void)shareTravel{
    /*
     关于分享的文案
     1、旅游活动分享
     标题：旅游活动名称
     图片：下乡客新Logo
     描述：我在下乡客参加******活动！活动太火爆，要使劲戳才能报上名哦~*/
    
    
}

+ (void)shareVillageTitle:(NSString *)title descr:(NSString *)descr shareUrl:(NSString *)shareUrl thumImage:(id)thumImage{
    /*
     2、乡村分享
     标题：乡村名称
     图片：乡村详情页顶部图片
     描述：Hi，我在下乡客发现了这个能让你眼放绿光的地方，你快来啊！
     */
}

- (void)shareTopic{
    /*
     3、专题分享
     标题：专题名称
     图片：专题列表页图片
     描述：Hi，下乡客MM使出洪荒之力的倾情推荐，你不看，她会哭的~
     */
}

- (void)shareHotel{
    /*
     4、民宿分享
     标题：民宿名称
     图片：民宿列表页图片
     描述：Hi，下乡客能在线预定民宿了，这么漂亮的民宿，你不来，她会一直等~
     URL：
     */
}

- (void)shareTicket{
    /*
     5、门票分享
     标题：门票名称
     图片：门票列表页图片
     描述：Hi，下乡客能在线预订门票了，实惠又方便！
     */
}

- (void)shareMagazine{
    /*
     6、微刊分享
     标题：微刊名称
     图片：微刊列表页图片
     描述：Hi，下乡客******微刊简直美醉了！图美文美音乐美，看的我骨头都酥了！
     */
}

- (void)shareLive{
    /*
     7、直播分享
     标题：直播名称
     图片：直播列表页图片
     描述：Hi，没到现场不是你的错，不看******直播，就说不过去了哦~
     */
}

+ (UMShareWebpageObject *)shareApp{
    /*
     说明_关于分享App给好友的说明
     1、分享的图片采用下乡客的新Logo（如无新Logo，杨浩可提供）；
     2、分享的标题为：下乡客-******（广告语老板暂时还未定，故分享的标题待定）；
     3、分享的描述为：下乡客，为您精心推荐最美乡村、最特色民宿、周边乡村游玩攻略、乡村特色旅游活动…再也不愁周末去哪儿
     4、分享的页面可自主设计，如果时间不允许可直接跳转至应用宝的下乡客介绍下载页
     长地址：http://app.qq.com/#id=detail&appid=1104484812
     短地址： http://dwz.cn/4KKUaJ
     */
    
    UMShareWebpageObject *shareObject = [VPShareManage shareWebPageObjectWithTitle:@"下乡客-******"
                                                                             descr:@"下乡客，为您精心推荐最美乡村、最特色民宿、周边乡村游玩攻略、乡村特色旅游活动…再也不愁周末去哪儿"
                                                                         thumImage:nil
                                                                          shareUrl:@"http://dwz.cn/4KKUaJ"];
    return shareObject;
}

/**
 创建网页分享内容对象
 
 @param title 标题
 @param descr 界面
 @param thumImage 缩略图
 @param shareUrl 分享的URL
 @return 返回网页分享的对象
 */
+ (UMShareWebpageObject *)shareWebPageObjectWithTitle:(NSString *)title descr:(NSString *)descr thumImage:(id)thumImage shareUrl:(NSString *)shareUrl{
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:descr thumImage:thumImage];
    //设置网页地址
    shareObject.webpageUrl = shareUrl;
    return shareObject;
}

/**
 创建分享消息的对象
 
 @param shareObject 分享的内容对象
 @return 返回分享消息对象
 */
+ (UMSocialMessageObject *)messageObjectWithShareObject:(id)shareObject{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    return messageObject;
}

@end
