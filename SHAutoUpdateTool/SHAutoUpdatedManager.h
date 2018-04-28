//
//  SHAutoUpdatedManager.h
//  3HBaseProject
//
//  Created by apple on 2018/4/19.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAutoUpdatedManager : NSObject

/**
 目前检测有新版本后弹出系统默认样式的alertView,
 如需个性化alertView, 请到.m文件里面自行修改代码
 */

/// 单例
+ (SHAutoUpdatedManager *)sharedManager;

/**
 检查是否需要更新版本, 需要则弹出alertView提示更新, 点击跳转appStore更新

 @param appID 一定要先配置自己项目在商店的APPID,配置完最好在真机上运行才能看到完全效果哦
              示例appID @"1305679109"
 */
- (void)sh_checkIfPushToAppStoreWithAppID:(NSString *)appID;

@end
