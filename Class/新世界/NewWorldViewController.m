//
//  NewWorldViewController.m
//  YCSTDemo
//
//  Created by nan gu on 16/11/14.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "NewWorldViewController.h"

@interface NewWorldViewController()

@end

@implementation NewWorldViewController

+ (void)load {
    [DFRouter registerURL:GN_NewWorld forViewController:[self class]];
    
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"新世界";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
}



@end
