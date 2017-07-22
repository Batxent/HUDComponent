//
//  UIWindow+DEWHUD.m
//  HUDComponent
//
//  Created by Shaw on 2017/6/26.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "UIWindow+DEWHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "GTProgressView.h"


static int kBoxTag = 66666;
static int kToastHUDTag  = 77777;
static int kLoadingViewTag = 99999;
static int kProgressViewTag = 88888;

@implementation UIWindow (DEWHUD)


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
        
        loadingImageView.center = backgroundView.center;
        loadingImageView.bounds = CGRectMake(0, 0, 66, 66);
        
        [self _animation:^{
            [self addSubview:backgroundView];
        }];
        
    }
}

- (void)hideAnimating
{
   
    UIView *view = [self viewWithTag:kLoadingViewTag];
    
    [self _animation:^{
        [view removeFromSuperview];
    }];
}

- (void)showProgressHUD:(CGFloat)progress
{
   
    GTProgressView *progressView = [self viewWithTag:kProgressViewTag];
    if (!progressView) {
        progressView = [[GTProgressView alloc]initWithView:self];
        progressView.tag = kProgressViewTag;
        
        [self _animation:^{
            [self addSubview:progressView];
        }];
        
    }
    progressView.progress = progress;
}

- (void)hideProgressHUD
{
  
    GTProgressView *progressView = [self viewWithTag:kProgressViewTag];
    [self _animation:^{
        [progressView removeFromSuperview];
    }];
}

- (void)showPopupWithView:(UIView *)customView shouldShowMask:(BOOL)show
{
    [self hidePopup];
    UIView *backgroudView = [UIView new];
    backgroudView.frame = self.bounds;
    backgroudView.tag = kBoxTag;
    
    if (show) {
        backgroudView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
    }else {
        backgroudView.backgroundColor = [UIColor clearColor];
    }
    customView.center = self.center;
    [backgroudView addSubview:customView];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_dewTapSelected:)];
    [backgroudView addGestureRecognizer:tapRecognizer];
    
    [self _animation:^{
        [self addSubview:backgroudView];
    }];
    
}

- (void)hidePopup
{
    UIView *view = [self viewWithTag:kBoxTag];
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
    
    MBProgressHUD *hud = [self viewWithTag:kToastHUDTag];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        hud.tag = kToastHUDTag;
        hud.mode = MBProgressHUDModeText;
        hud.userInteractionEnabled = NO;
    }
    
    hud.label.text = title;
    hud.detailsLabel.text = detail;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD hideHUDForView:self animated:YES];
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
