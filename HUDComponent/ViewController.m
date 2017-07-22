//
//  ViewController.m
//  HUDComponent
//
//  Created by Shawn on 2017/4/1.
//  Copyright © 2017年 Dawa Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+DEWHUD.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"HUDComponent";
    self.view.backgroundColor = [UIColor whiteColor];

//    [self showToastWithTitle:@"金高" detail:@"我的天哪"];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];

    [self.view addSubview:self.tableView];

    [self layoutPageSubviews];

}

- (void)layoutPageSubviews
{
    self.tableView.frame = self.view.bounds;


}

#pragma mark - TableView delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [[self contentDictionary].allKeys objectAtIndex:indexPath.row];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *content = [self contentDictionary];
    NSString *viewControllerString = [content.allValues objectAtIndex:indexPath.row];

    UIViewController *viewController = [[NSClassFromString(viewControllerString) alloc]init];
    [self.navigationController pushViewController:viewController animated:YES];

}

#pragma mark - TableView data souce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *content = [self contentDictionary];
    return content.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    return cell;
}

#pragma mark - setters and getters
- (UITableView *)tableView
{
    if (_tableView) return _tableView;
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    return _tableView;
}

- (NSDictionary *)contentDictionary
{
    return @{@"toast":@"ToastViewController",@"自定义弹框":@"CustomViewViewController",@"loading动画":@"LoadingViewController",@"进度条":@"ProgressViewController"};
}


@end
