//
//  HotThemeViewController.m
//  YCSTDemo
//
//  Created by nan gu on 16/11/7.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "HotThemeViewController.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "DFTableRefreshHeader.h"

@interface HotThemeViewController()<SDCycleScrollViewDelegate>

@end

@implementation HotThemeViewController

+ (void)load {
    [DFRouter registerURL:GN_HotTheme forViewController:[self class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)configUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    SDCycleScrollView *adVC = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, GN_SCREEN_WIDTH, GN_SCREEN_WIDTH*346/616) imageNamesGroup:@[@"ad",@"ad",@"ad"]];
    adVC.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    adVC.delegate = self;
    adVC.autoScrollTimeInterval = 3;
    self.tableView.tableHeaderView = adVC;
    self.tableView.tableFooterView = [UIView new];
}

- (void)beginRefreshing{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];
    });
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.textLabel.text = @"啦啦啦😋";
    return cell;
}

- (void)refreshList {
    self.tableView.mj_header = [DFTableRefreshHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.tableView.mj_header endRefreshing];
        });
    }];
}
@end
