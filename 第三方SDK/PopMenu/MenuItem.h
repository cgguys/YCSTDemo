//
//  MenuItem.h
//  JackFastKit
//
//  Created by 曾 宪华 on 14-10-13.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

// ==========================================
//  MenuItem 菜单元素  数据模型
// ==========================================

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuItem : NSObject

/**
 *   标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  配图
 */
@property (nonatomic, strong) UIImage *iconImage;

/**
 *
 */
@property (nonatomic, strong) UIColor *glowColor;

/**
 *  按钮索引
 */
@property (nonatomic, assign) NSInteger index;

#pragma mark - 初始话 init

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName NS_AVAILABLE_IOS(2_0);

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor NS_AVAILABLE_IOS(2_0);

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                        index:(NSInteger)index NS_AVAILABLE_IOS(2_0);

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSInteger)index NS_AVAILABLE_IOS(2_0);

+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName NS_AVAILABLE_IOS(2_0);

+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor NS_AVAILABLE_IOS(2_0);

+ (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                        index:(NSInteger)index NS_AVAILABLE_IOS(2_0);

+ (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSInteger)index NS_AVAILABLE_IOS(2_0);

@end

NS_INLINE MenuItem* MenuItemMake(NSString* title, NSString *imageName) {
    MenuItem *item = [[MenuItem alloc] initWithTitle:title iconName:imageName];
    return item;
}
