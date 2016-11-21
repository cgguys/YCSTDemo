//
//  UIButton+Block.h
//  YCSTDemo
//
//  Created by nan gu on 16/10/18.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapActionBlock)(UIButton *button);

@interface UIButton (Block)

@property (nonatomic, copy) TapActionBlock actionBlock;

+ (UIButton *)creatButtonFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)color tapActionBlock:(TapActionBlock)actionBlock;

@end
