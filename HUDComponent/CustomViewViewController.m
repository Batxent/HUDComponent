//
//  CustomViewViewController.m
//  
//
//  Created by Shawn on 2017/5/11.
//
//

#import "CustomViewViewController.h"
#import "DEWHUDWarpper.h"

@interface CustomViewViewController ()

@end


@implementation CustomViewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)buttonClicked:(UIButton *)sender
{
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        view.frame = CGRectMake(0, 0, 300, 300);
    
    [DEWHUDWarpper showPopupWithView:view shouldShowMask:YES];
}


@end
