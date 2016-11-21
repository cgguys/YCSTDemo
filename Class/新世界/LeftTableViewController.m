//
//  LeftTableViewController.m
//  YCSTDemo
//
//  Created by nan gu on 16/11/14.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "LeftTableViewController.h"

@implementation LeftTableViewController

+ (void)load {
    [DFRouter registerURL:GN_Left forViewController:[self class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configUI {
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.textLabel.text = @"😄😝😁👌✅";
    return cell;
}

- (void)refreshList {
    
}
@end
