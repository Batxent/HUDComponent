//
//  DEWHUDWarpper.h
//  HUDComponent
//
//  Created by Shaw on 2017/6/26.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DEWHUDWarpper : NSObject

+ (void)showToast:(NSString *)toast;
+ (void)showToastWithTitle:(NSString *)title detail:(NSString *)detail;

+ (void)showAlertWithTitle:(NSString *)title
                       message:(NSString *)message
                  actionTitles:(NSArray <NSString *> *)actions
               cancelItemTitle:(NSString *)cancelTitle
                    alertStyle:(UIAlertControllerStyle)style
                  actionHandle:(void (^) (NSString *actionTitle))handles;

/**
 弹窗
 默认会居中，使用前需要先自定义custom view的bounds
 
 @param show 如果是YES，在window上会先添加一层黑色蒙版
 */
+ (void)showPopupWithView:(UIView *)customView  shouldShowMask:(BOOL)show;
+ (void)hidePopup;

/**
 展示全屏loading动画,注意无法在viewDidLoad里面使用
 */
+ (void)showAnimatingWithImages:(NSArray *)images;
+ (void)hideAnimating;

+ (void)showProgressHUD:(CGFloat)progress;
+ (void)hideProgressHUD;


@end
