//
//  ToastViewController.m
//  HUDComponent
//
//  Created by Shawn on 2017/5/11.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "ToastViewController.h"
#import "DEWHUDWarpper.h"

@interface ToastViewController ()

@end



@implementation ToastViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    self.title = @"toast";
    
    
}


#pragma mark - Event response
- (void)buttonClicked:(UIButton *)sender
{
   
    
    [DEWHUDWarpper showToast:@"toast"];

}




@end
