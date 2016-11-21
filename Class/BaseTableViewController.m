//
//  BaseTableViewController.m
//  YCSTDemo
//
//  Created by nan gu on 16/11/7.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "BaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self refreshList];
}

- (void)configUI {

}

- (void)refreshList {
   self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(beginRefreshing)];
}

- (void)beginRefreshing {

}

@end
