//
//  ViewController.m
//  SHAutoUpdatedToolDemo
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

#import "ViewController.h"
#import "SHAutoUpdatedManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 检查自动更新
    [SHAutoUpdatedManager sh_checkIfPushToAppStoreWithAppID:@"1305679109"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
