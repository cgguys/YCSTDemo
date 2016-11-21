//
//  IndexViewController.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/18.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "IndexViewController.h"
#import "DLLRUCache.h"
#import "DLSlideView.h"
#import "DLScrollTabbarView.h"
#import "DLCustomSlideView.h"
#import "HotThemeViewController.h"
#import <MJRefresh.h>

@interface IndexViewController ()<DLCustomSlideViewDelegate>

@property (strong, nonatomic) DLCustomSlideView *slideView;

@end

@implementation IndexViewController
{
    NSMutableArray *itemArray_;
}

+ (void)load {
    [DFRouter registerURL:GN_Index forViewController:[self class]];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_project_normal"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_project_selected"];
        self.title = @"项目";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)configUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.slideView = [[DLCustomSlideView alloc] initWithFrame:CGRectMake(0, 64, GN_SCREEN_WIDTH, GN_SCREEN_HEIGHT - 108)];
    [self.view addSubview:self.slideView];
    
    DLLRUCache *cache = [[DLLRUCache alloc] initWithCount:2];
    DLScrollTabbarView *tabbar = [[DLScrollTabbarView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 34)];
    tabbar.tabItemNormalColor = [UIColor blackColor];
    tabbar.tabItemSelectedColor = [UIColor flatRedColor];
    tabbar.tabItemNormalFontSize = 14.0f;
    tabbar.trackColor = [UIColor flatRedColor];
    itemArray_ = [NSMutableArray array];
    NSArray *titleArray = @[@"热门主题",@"版块",@""];
    for (int i=0; i<2; i++) {
        DLScrollTabbarItem *item = [DLScrollTabbarItem itemWithTitle:[NSString stringWithFormat:@"%@",titleArray[i]] width:GN_SCREEN_WIDTH/2];
        [itemArray_ addObject:item];
    }
    tabbar.tabbarItems = itemArray_;
    
    self.slideView.tabbar = tabbar;
    self.slideView.delegate = self;
    self.slideView.cache = cache;
    self.slideView.tabbarBottomSpacing = 5;
    self.slideView.baseViewController = self;
    [self.slideView setup];
    self.slideView.selectedIndex = 0;
    

}


- (NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender {
    return itemArray_.count;
}

- (UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index {
    if (index == 0) {
        return [DFRouter pageWithURL:GN_HotTheme withNav:NO];
    }else {
        return [DFRouter pageWithURL:GN_Plate withNav:NO];
    }
}

@end
