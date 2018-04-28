//
//  SHAutoUpdatedManager.m
//  3HBaseProject
//
//  Created by apple on 2018/4/19.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

#import "SHAutoUpdatedManager.h"
#import <UIKit/UIKit.h>
@interface SHAutoUpdatedManager ()
//@property (nonatomic, copy)NSString *appID;
{
    NSString *appID;
}
@end

@implementation SHAutoUpdatedManager

//static SHAutoUpdatedManager *manager = nil;
//
///// 单例
//+ (SHAutoUpdatedManager *)sharedManager{
//    static dispatch_once_t once;
//    dispatch_once(&once, ^{
//        manager = [[SHAutoUpdatedManager alloc] init];
//    });
//    return manager;
//}

/// 判断是否需要更新, 跳转到app Store
+ (void)sh_checkIfPushToAppStoreWithAppID:(NSString *)appID{
    appID = appID;
    // 1.获取本机APP版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
    
    // 2.获取app store版本号
    NSError *error;
    NSData *response = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/us/lookup?id=%@",appID]]] returningResponse:nil error:nil];
    if (response == nil) {
        NSLog(@"你没有连接网络哦");
        return;
    }
    NSDictionary *appInfoDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        NSLog(@"hsUpdateAppError:%@",error);
        return;
    }
    NSArray *array = appInfoDic[@"results"];
    if (array.count > 0) {
        NSDictionary *dic = array[0];
        NSString *appStoreVersion = dic[@"version"];
        
        // 3.对比
        // 打印版本号
        NSLog(@"当前版本号:%@\n商店版本号:%@",currentVersion,appStoreVersion);
        if([currentVersion floatValue] < [appStoreVersion floatValue])
        {
            /**
             目前检测有新版本后弹出系统默认样式的alertView,
             如需个性化alertView, 请修改以下代码, 自行根据需求写一个alertView
             */
            UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"检测到有新版本, 是否需要去更新?" delegate:self cancelButtonTitle:@"暂时不" otherButtonTitles:@"去更新", nil];
            [alertV show];
        }else{
            NSLog(@"版本号好像比商店大噢!检测到不需要更新");
        }
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?ls=1&mt=8", appID]];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
