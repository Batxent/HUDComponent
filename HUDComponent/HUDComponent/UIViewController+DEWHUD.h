//
//  UIViewController+HUDShowing.h
//  HUDComponent
//
//  Created by Shawn on 2017/4/1.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DEWHUD)

- (void)dew_showToast:(NSString *)toast;
- (void)dew_showToastWithTitle:(NSString *)title detail:(NSString *)detail;

/**
 默认居中，custom view 的bounds 需要提前设好
 */
- (void)dew_showBoxWithCustomView:(UIView *)customView  shouldShowBackgroundView:(BOOL)show;
- (void)dew_hideBox;

/**
 展示全屏loading动画,注意无法在viewDidLoad里面使用
 */
- (void)dew_showLoadingAnimating;
- (void)dew_hideLoadingAnimating;

- (void)dew_showProgressHUD:(CGFloat)progress;
- (void)dew_hideProgressHUD;


@end
