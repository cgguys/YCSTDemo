//
//  AppDelegate.h
//  YCSTDemo
//
//  Created by nan gu on 16/6/7.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GNTabBarController.h"

#define ApplicationDelegate ((AppDelegate*)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) UITabBarController *mainTabBarController;

@property (strong, nonatomic)  GNTabBarController *tabBarController;

@end

