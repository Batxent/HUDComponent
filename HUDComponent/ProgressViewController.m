//
//  ProgressViewController.m
//  HUDComponent
//
//  Created by Shawn on 2017/5/11.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "ProgressViewController.h"
#import "DEWHUDWarpper.h"

@interface ProgressViewController ()

@end

@implementation ProgressViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)buttonClicked:(UIButton *)sender
{

    [DEWHUDWarpper showProgressHUD:0.1];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           [DEWHUDWarpper showProgressHUD:0.2];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [DEWHUDWarpper showProgressHUD:0.3];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [DEWHUDWarpper showProgressHUD:0.8];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                       [DEWHUDWarpper hideProgressHUD];
                    });
                });
            });
        });

}


@end
