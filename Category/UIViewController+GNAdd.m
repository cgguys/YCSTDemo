//
//  UIViewController+GNAdd.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/10.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "UIViewController+GNAdd.h"
#import "APLSlideMenuViewController.h"

@implementation UIViewController (GNAdd)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(viewDidLoad) andAnotherSelecor:@selector(gn_viewDidLoad)];
        [self swizzleMethod:@selector(viewWillAppear:) andAnotherSelecor:@selector(gn_viewWillAppear:)];
        [self swizzleMethod:@selector(viewWillDisappear:) andAnotherSelecor:@selector(gn_viewWillDisappear:)];
    });
}

- (void)gn_viewDidLoad {
    [self gn_viewDidLoad];
    if ([self conformsToProtocol:NSProtocolFromString(@"DFRouter")]) {
        self.view.backgroundColor = [UIColor flatGrayColor];
    }
    self.slideMenuController.gestureSupport = APLSlideMenuGestureSupportDrag;
}

- (void)gn_viewWillAppear {
    [self gn_viewWillAppear];
}

- (void)gn_viewWillDisappear {
    [self gn_viewWillDisappear];
}

- (UIViewController *)gn_topMostViewController {
    if (self.presentedViewController == nil) {
        return self;
    }else if ([self.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)self.presentedViewController;
       UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [lastViewController gn_topMostViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)self.presentedViewController;
    return [presentedViewController gn_topMostViewController];
}

@end
