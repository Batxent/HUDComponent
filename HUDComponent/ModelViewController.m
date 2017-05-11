//
//  ModelViewController.m
//  HUDComponent
//
//  Created by Shawn on 2017/5/11.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ModelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.button];
    [self layoutPageSubviews];
}

- (void)layoutPageSubviews
{
    self.button.frame = CGRectMake((self.view.bounds.size.width - 100) / 2.0, self.view.bounds.size.height - 200, 100, 50);

}

#pragma mark - Event response
- (void)buttonClicked:(UIButton *)sender
{



}

#pragma mark - Setters and getters
- (UIButton *)button
{
    if (_button) return _button;
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    [_button setTitle:@"show" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];

    return _button;
}

@end
