//
//  TouchIDViewController.m
//  TouchID
//
//  Created by wangdehuai on 14/12/3.
//  Copyright (c) 2014年 wangdehuai. All rights reserved.
//

#import "TouchIDViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface TouchIDViewController ()

@end

@implementation TouchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"请与您的指纹进行身份验证继续";
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalizedReasonString reply:^(BOOL success,NSError *error)
        {
            if (success) {
                NSLog(@"验证成功");
            }else{
                NSLog(@"验证失败");
            }
        }];
    }else{
        NSLog(@"无法评估政策;看authError并提出相应的消息用户");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
