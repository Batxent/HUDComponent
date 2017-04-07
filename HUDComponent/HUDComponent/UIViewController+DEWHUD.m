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

- (void)dew_showToast:(NSString *)toast
{
    [self _showToastWithTitle:nil detail:toast];
}

- (void)dew_showToastWithTitle:(NSString *)title detail:(NSString *)detail
{
    [self _showToastWithTitle:title detail:detail];
}

- (void)dew_showLoadingAnimating
{
    UIImageView *loadingImageView = [[UIImageView alloc]init];
    loadingImageView.animationImages = _loadingImages();
    loadingImageView.animationDuration = 0.045 * 20;
    loadingImageView.animationRepeatCount = 0;
    [loadingImageView startAnimating];

    UIView *backgroundView = [UIView new];
    backgroundView.tag = kLoadingViewTag;
    backgroundView.frame = [UIScreen mainScreen].bounds;
    backgroundView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.770];
    [backgroundView addSubview:loadingImageView];

    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:backgroundView];

    loadingImageView.center = backgroundView.center;
    loadingImageView.bounds = CGRectMake(0, 0, 66, 66);
}

- (void)dew_hideLoadingAnimating
{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIView *view = [window viewWithTag:kLoadingViewTag];
    [view removeFromSuperview];
}

- (void)dew_showProgressHUD:(CGFloat)progress
{
    GTProgressView *progressView = [self.view viewWithTag:kProgressViewTag];
    if (!progressView) {
        progressView = [[GTProgressView alloc]initWithView:self.view];
        progressView.tag = kProgressViewTag;
        [self.view addSubview:progressView];
    }
    progressView.progress = progress;
}

- (void)dew_hideProgressHUD
{
    GTProgressView *progressView = [self.view viewWithTag:kProgressViewTag];
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
        [progressView setHidden:YES];
    } completion:^(BOOL finished) {
        if (finished) {
            [progressView removeFromSuperview];
        }
    }];
}

- (void)dew_showBoxWithCustomView:(UIView *)customView shouldShowBackgroundView:(BOOL)show
{
    [self dew_hideBox];
    UIView *backgroudView = [UIView new];
    backgroudView.frame = self.view.bounds;
    [self.view addSubview:backgroudView];
    backgroudView.tag = kBoxTag;

    if (show) {
        backgroudView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8];
    }else {
        backgroudView.backgroundColor = [UIColor clearColor];
    }

    [backgroudView addSubview:customView];
    customView.center = self.view.center;

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_dewTapSelected:)];
    [backgroudView addGestureRecognizer:tapRecognizer];

}

- (void)dew_hideBox
{
    UIView *view = [self.view viewWithTag:kBoxTag];
    if (view) {
        [view removeFromSuperview];
    }
}

#pragma mark - Envet response
- (void)_dewTapSelected:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        [sender.view removeFromSuperview];
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

NSArray *_loadingImages() {
    static NSArray *tvImges;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableArray *mutable = @[].mutableCopy;
        for (int i = 0; i < 20 ; i ++) {
            NSString *imageName = [NSString stringWithFormat:@"%d",i + 1];
            UIImage *image = [UIImage imageNamed:imageName];
            if (image) {
                [mutable addObject:image];
            }
        }
        tvImges = mutable;
    });
    return tvImges;
}


@end






