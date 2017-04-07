//
//  ViewController.m
//  HUDComponent
//
//  Created by Shawn on 2017/4/1.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+DEWHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

  //  [self dew_showToastWithTitle:@"金高" detail:@"我的天哪"];

    [self dew_showProgressHUD:0.1];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dew_showProgressHUD:0.2];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dew_showProgressHUD:0.5];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dew_hideProgressHUD];
            });
        });
    });

//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor redColor];
//    view.frame = CGRectMake(0, 0, 100, 100);
//    [self dew_showBoxWithCustomView:view shouldShowBackgroundView:NO];
   // [self dew_showToast:@"你说什么?"];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     //[self dew_showLoadingAnimating];


}


@end
