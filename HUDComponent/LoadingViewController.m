//
//  LoadingViewController.m
//  HUDComponent
//
//  Created by Shawn on 2017/5/11.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "LoadingViewController.h"

@interface LoadingViewController ()

@end

@implementation LoadingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    
}

- (void)buttonClicked:(UIButton *)sender
{
    [self dew_showAnimatingWithImages:[self images]];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dew_hideAnimating];
    });


}


- (NSArray *)images
{
    NSMutableArray *tempArray = @[].mutableCopy;
    for (int i = 0; i < 22; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"%d",i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        [tempArray addObject:image];
    }
    return tempArray.copy;
}



@end
