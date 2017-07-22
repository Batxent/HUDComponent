//
//  UIWindow+DEWHUD.h
//  HUDComponent
//
//  Created by Shaw on 2017/6/26.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (DEWHUD)

- (void)showToast:(NSString *)toast;
- (void)showToastWithTitle:(NSString *)title detail:(NSString *)detail;

/**
 默认居中，custom view 的bounds 需要提前设好
 */
//- (void)showBoxWithCustomView:(UIView *)customView  shouldShowBackgroundView:(BOOL)show;
//- (void)hideBox;

- (void)showPopupWithView:(UIView *)customView  shouldShowMask:(BOOL)show;
- (void)hidePopup;


/**
 展示全屏loading动画,注意无法在viewDidLoad里面使用
 */
- (void)showAnimatingWithImages:(NSArray *)images;
- (void)hideAnimating;

- (void)showProgressHUD:(CGFloat)progress;
- (void)hideProgressHUD;

@end
