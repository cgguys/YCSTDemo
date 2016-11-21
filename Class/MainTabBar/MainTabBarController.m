//
//  BaseTabBarViewController.m
//  YCSTDemo
//
//  Created by nan gu on 16/6/13.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

+ (void)load {
    [DFRouter registerURL:GN_MainTabBar forViewController:[self class]];
}

- (instancetype)init {
    if (self = [super init]) {
        [self setUpVC];
    }
    return self;
}

- (void)setUpVC {
    self.slideVC = [[APLSlideMenuViewController alloc] init];
    self.slideVC.leftMenuViewController = [DFRouter pageWithURL:GN_Left];
    self.slideVC.contentViewController = [DFRouter pageWithURL:GN_NewWorld withNav:YES];
    self.slideVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_normal"];
    self.slideVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_message_selected"];
    self.slideVC.title = @"新世界";
    self.slideVC.gestureSupport = APLSlideMenuGestureSupportDrag;
    self.slideVC.tapOnContentViewToHideMenu = YES;
    
    self.viewControllers = @[[DFRouter pageWithURL:GN_Index withNav:YES],
                             self.slideVC,
                             [DFRouter pageWithURL:GN_Me withNav:YES],
                             ];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}


@end
