//
//  UIViewController+HUDShowing.m
//  HUDComponent
//
//  Created by Shawn on 2017/4/1.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIViewController+DEWHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "GTProgressView.h"


static int kBoxTag = 66666;
static int kToastHUDTag  = 77777;
static int kLoadingViewTag = 99999;
static int kProgressViewTag = 88888;

@implementation UIViewController (DEWHUD)

- (void)showToast:(NSString *)toast
{
    [self _showToastWithTitle:nil detail:toast];
}

- (void)showToastWithTitle:(NSString *)title detail:(NSString *)detail
{
    [self _showToastWithTitle:title detail:detail];
}

- (void)showAnimatingWithImages:(NSArray *)images
{
    if (images.count) {
        UIImageView *loadingImageView = [[UIImageView alloc]init];
        loadingImageView.animationImages = images;
        loadingImageView.animationDuration = 0.045 * images.count;
        loadingImageView.animationRepeatCount = 0;
        [loadingImageView startAnimating];

        UIView *backgroundView = [UIView new];
        backgroundView.tag = kLoadingViewTag;
        backgroundView.frame = [UIScreen mainScreen].bounds;
        backgroundView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.770];
        [backgroundView addSubview:loadingImageView];

        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        loadingImageView.center = backgroundView.center;
        loadingImageView.bounds = CGRectMake(0, 0, 66, 66);

        [self _animation:^{
            [window addSubview:backgroundView];
        }];

    }
}

- (void)hideAnimating
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIView *view = [window viewWithTag:kLoadingViewTag];

    [self _animation:^{
        [view removeFromSuperview];
    }];
}

- (void)showProgressHUD:(CGFloat)progress
{
    GTProgressView *progressView = [self.view viewWithTag:kProgressViewTag];
    if (!progressView) {
        progressView = [[GTProgressView alloc]initWithView:self.view];
        progressView.tag = kProgressViewTag;

        [self _animation:^{
            [self.view addSubview:progressView];
        }];

    }
    progressView.progress = progress;
}

- (void)hideProgressHUD
{
    GTProgressView *progressView = [self.view viewWithTag:kProgressViewTag];
    [self _animation:^{
        [progressView removeFromSuperview];
    }];
}

- (void)showBoxWithCustomView:(UIView *)customView shouldShowBackgroundView:(BOOL)show
{
    [self hideBox];
    UIView *backgroudView = [UIView new];
    backgroudView.frame = self.view.bounds;
    backgroudView.tag = kBoxTag;

    if (show) {
        backgroudView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8];
    }else {
        backgroudView.backgroundColor = [UIColor clearColor];
    }
    customView.center = self.view.center;
    [backgroudView addSubview:customView];

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_dewTapSelected:)];
    [backgroudView addGestureRecognizer:tapRecognizer];

    [self _animation:^{
        [self.view addSubview:backgroudView];
    }];
}

- (void)hideBox
{
    UIView *view = [self.view viewWithTag:kBoxTag];
    if (view) {
        [self _animation:^{
            [view removeFromSuperview];
        }];

    }
}

#pragma mark - Envet response
- (void)_dewTapSelected:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self _animation:^{
            [sender.view removeFromSuperview];
        }];
    }
}

#pragma mark - Privite

- (void)_showToastWithTitle:(NSString *)title detail:(NSString *)detail
{

    MBProgressHUD *hud = [self.view viewWithTag:kToastHUDTag];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.tag = kToastHUDTag;
        hud.mode = MBProgressHUDModeText;
        hud.userInteractionEnabled = NO;
    }

    hud.label.text = title;
    hud.detailsLabel.text = detail;

    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (void)_animation:(void(^)(void))animation
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (animation) {
            animation();
        }
    } completion:nil];
}


@end



