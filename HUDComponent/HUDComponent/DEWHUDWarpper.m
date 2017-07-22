//
//  DEWHUDWarpper.m
//  HUDComponent
//
//  Created by Shaw on 2017/6/26.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "DEWHUDWarpper.h"
#import "UIWindow+DEWHUD.h"
#import "UIViewController+DEWAlertController.h"

@implementation DEWHUDWarpper

+ (void)showToast:(NSString *)toast
{
    
    [_currentWindow() showToast:toast];
}

+ (void)showToastWithTitle:(NSString *)title detail:(NSString *)detail
{

    [_currentWindow() showToastWithTitle:title detail:detail];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray<NSString *> *)actions cancelItemTitle:(NSString *)cancelTitle alertStyle:(UIAlertControllerStyle)style actionHandle:(void (^)(NSString *))handles
{
    
    [[self getCurrentViewController] dew_showAlertWithTitle:title message:message actionTitles:actions cancelItemTitle:cancelTitle alertStyle:style actionHandle:handles];
}

/**
 默认居中，custom view 的bounds 需要提前设好
 */
+ (void)showPopupWithView:(UIView *)customView shouldShowMask:(BOOL)show
{
    
    [_currentWindow() showPopupWithView:customView shouldShowMask:show];
}

+ (void)hidePopup
{
    [_currentWindow() hidePopup];
}

/**
 展示全屏loading动画,注意无法在viewDidLoad里面使用
 */
+ (void)showAnimatingWithImages:(NSArray *)images
{

    [_currentWindow() showAnimatingWithImages:images];
}

+ (void)hideAnimating
{
    
    [_currentWindow() hideAnimating];
}

+ (void)showProgressHUD:(CGFloat)progress
{

    [_currentWindow() showProgressHUD:progress];
}

+ (void)hideProgressHUD
{

    [_currentWindow() hideProgressHUD];
}


UIWindow *_currentWindow () {

    return [[UIApplication sharedApplication].delegate window];
}


+ (id)getCurrentViewController
{
    UIViewController *WindowRootVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    
    UIViewController *currentViewController = [self findTopViewController:WindowRootVC];
    
    return currentViewController;
}

+ (id)findTopViewController:(id)inController
{
    
    if ([inController isKindOfClass:[UITabBarController class]]) {
        return [self findTopViewController:[inController selectedViewController]];
    }else if ([inController isKindOfClass:[UINavigationController class]]) {
        return [self findTopViewController:[inController visibleViewController]];
    }else if ([inController isKindOfClass:[UIViewController class]]) {
        return inController;
    }else {
        return nil;
    }
}


@end


