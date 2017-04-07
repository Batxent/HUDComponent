//
//  GTProgressView.m
//  Gets
//
//  Created by Shawn on 2017/2/7.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "GTProgressView.h"

@interface GTProgressView ()


@property(nonatomic, strong) UIColor *progressTintColor;

@property (nonatomic, strong) UIView *borderView;
@property (nonatomic, strong) UIView *progressView;

@property (nonatomic, strong) UIView *progressWholeView;

@property (nonatomic, readwrite) CGFloat width;
@property (nonatomic, readwrite) CGFloat height;

@property (nonatomic, strong) UIView *view;


@end


@implementation GTProgressView


- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {


        self.view = view;

        self.frame = self.view.bounds;
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.8];

        [self addSubview:self.borderView];
        [self.borderView addSubview:self.progressWholeView];
        [self.borderView addSubview:self.progressView];

        [self layoutPageSubviews];
    }
    return self;
}

- (void)layoutPageSubviews
{

    self.width = [UIScreen mainScreen].bounds.size.width * 0.7;
    self.height = 15;

    //长屏幕一半，高15

    self.borderView.center = self.view.center;
    self.borderView.bounds = CGRectMake(0 , 0, self.width, self.height);

    self.progressView.frame = CGRectMake(5, 5, 0, self.height - 10);
    self.progressWholeView.frame = CGRectMake(5, 5, self.width - 10, self.height - 10);
    self.progressWholeView.layer.cornerRadius = self.progressWholeView.bounds.size.height / 2.0;
    self.progressWholeView.layer.masksToBounds = YES;

    self.borderView.layer.cornerRadius = self.borderView.bounds.size.height / 2.0;
    self.borderView.layer.masksToBounds = YES;

}

#pragma mark - Privite
- (void)_setShadow
{
    [self.layer setShadowOffset:CGSizeMake(0, 1)];
    [self.layer setShadowRadius:9];
    [self.layer setShadowColor:[UIColor colorWithRed:92/255.0f green:241/255.0f blue:219/255.0f alpha:1].CGColor];
    [self.layer setShadowOpacity:0.3];
}

- (void)_hideShadow
{
    [self.layer setShadowRadius:0];
    self.layer.shadowOpacity = 0;
}

#pragma mark - Setters and getters
- (UIView *)borderView
{
    if (_borderView) return _borderView;
    _borderView = [[UIView alloc]init];
    _borderView.backgroundColor = [UIColor colorWithRed:12/255.0f green:12/255.0f blue:12/255.0f alpha:1];
    return _borderView;
}

- (UIView *)progressView
{
    if (_progressView) return _progressView;
    _progressView = [[UIView alloc]init];

    _progressView.backgroundColor = [UIColor colorWithRed:92/255.0f green:241/255.0f blue:219/255.0f alpha:1];
    return _progressView;
}

- (UIView *)progressWholeView
{
    if (_progressWholeView) return _progressWholeView;
    _progressWholeView = [[UIView alloc]init];

    _progressWholeView.backgroundColor = [UIColor colorWithRed:30/255.0f green:36/255.0f blue:43/255.0f alpha:1];
    return _progressWholeView;
}

- (void)setProgress:(float)progress
{
    _progress = progress;

    CGFloat progressHeight = 5;

    CGFloat progressWidth = self.width - 10;
    self.progressView.frame = CGRectMake(5, 5, progress * progressWidth, progressHeight);
    self.progressView.layer.cornerRadius = progressHeight / 2.0;
    self.progressView.layer.masksToBounds = YES;

    if (progress == 1.0) {
        [self _setShadow];
    }else {
        [self _hideShadow];
    }
    
}





@end
