//
//  AppDelegate+GNAdd.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/10.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "AppDelegate+GNAdd.h"
#import "UIViewController+GNAdd.h"

@implementation AppDelegate (GNAdd)

- (UIViewController *)gn_topViewController {
    UIViewController *topViewController = [[UIApplication sharedApplication].windows[0].rootViewController gn_topMostViewController];
    return topViewController;
}

@end
