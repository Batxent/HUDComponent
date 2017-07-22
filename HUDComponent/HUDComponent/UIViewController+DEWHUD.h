//
//  UIViewController+HUDShowing.h
//  HUDComponent
//
//  Created by Shawn on 2017/4/1.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DEWHUD)

- (void)showToast:(NSString *)toast;
- (void)showToastWithTitle:(NSString *)title detail:(NSString *)detail;

/**
 默认居中，custom view 的bounds 需要提前设好
 */
- (void)showBoxWithCustomView:(UIView *)customView  shouldShowBackgroundView:(BOOL)show;
- (void)hideBox;

/**
 展示全屏loading动画,注意无法在viewDidLoad里面使用
 */
- (void)showAnimatingWithImages:(NSArray *)images;
- (void)hideAnimating;

- (void)showProgressHUD:(CGFloat)progress;
- (void)hideProgressHUD;

@end

