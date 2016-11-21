//
//  GNTabBarController.m
//  YCSTDemo
//
//  Created by nan gu on 16/11/18.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "GNTabBarController.h"
#import "APLSlideMenuViewController.h"
@implementation GNTabBarController

- (CYLTabBarController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers tabBarItemsAttributes:self.tabBarItemsAttributesForController];
            [self customizeTabBarAppearance:_tabBarController];
    }

    return _tabBarController;
}

- (NSArray *)viewControllers {
    APLSlideMenuViewController *slideVC = [[APLSlideMenuViewController alloc] init];
    slideVC.leftMenuViewController = [DFRouter pageWithURL:GN_Left];
    slideVC.contentViewController = [DFRouter pageWithURL:GN_NewWorld withNav:YES];
    slideVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_normal"];
    slideVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_message_selected"];
    slideVC.title = @"新世界";
    slideVC.gestureSupport = APLSlideMenuGestureSupportDrag;
    slideVC.tapOnContentViewToHideMenu = YES;
    NSArray *viewControllers = @[[DFRouter pageWithURL:GN_Index withNav:YES],
                                 slideVC,
                                 [DFRouter pageWithURL:GN_Me withNav:YES]];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"首页",
                                                 CYLTabBarItemImage : @"tabbar_project_normal",
                                                 CYLTabBarItemSelectedImage : @"tabbar_project_selected"
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"新世界",
                                                  CYLTabBarItemImage : @"tabbar_message_normal",
                                                  CYLTabBarItemSelectedImage : @"tabbar_message_selected"
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"我",
                                                 CYLTabBarItemImage : @"tabbar_user_normal",
                                                 CYLTabBarItemSelectedImage : @"tabbar_user_selected"
                                                 };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       ];
    return tabBarItemsAttributes;
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    tabBarController.tabBarHeight = 54.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor flatGrayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor flatYellowColorDark];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
//     [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    // UITabBar *tabBarAppearance = [UITabBar appearance];
    // [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
}


@end
