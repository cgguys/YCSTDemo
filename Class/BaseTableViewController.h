//
//  BaseTableViewController.h
//  YCSTDemo
//
//  Created by nan gu on 16/11/7.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UITableViewController

- (void)viewDidLoad;

- (void)configUI;

- (void)refreshList;

- (void)beginRefresh;

@end
