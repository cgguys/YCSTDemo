//
//  PlateTableViewController.m
//  YCSTDemo
//
//  Created by nan gu on 16/11/7.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "PlateViewController.h"

@implementation PlateViewController

+ (void)load {
    [DFRouter registerURL:GN_Plate forViewController:[self class]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configUI {
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
