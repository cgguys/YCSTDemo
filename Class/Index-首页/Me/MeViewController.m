//
//  MeViewController.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/26.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "MeViewController.h"

@implementation MeViewController

+(void)load {
    [DFRouter registerURL:GN_Me forViewController:[self class]];
}

- (instancetype)init {
    if (self == [super init]) {
        self.title = @"我";
        self.tabBarItem.image =  [UIImage imageNamed:@"tabbar_user_normal"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_user_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configUI {
    self.view.backgroundColor = [UIColor flatGrayColor];
}
@end
