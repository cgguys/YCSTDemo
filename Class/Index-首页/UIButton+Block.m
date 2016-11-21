//
//  UIButton+Block.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/18.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

static NSString * keyOfButtonBlock;

@implementation UIButton (Block)

+ (UIButton *)creatButtonFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)color tapActionBlock:(TapActionBlock)tapActionBlock {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:color];
    [button addTarget:button action:@selector(tapButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.actionBlock = tapActionBlock;
    
    return button;
}

- (void)tapButtonAction:(UIButton *)sender {

    TapActionBlock block = self.actionBlock;
    if (block) {
        block(sender);
    }
}

- (void)setActionBlock:(TapActionBlock)actionBlock {
    
    objc_setAssociatedObject(self, &keyOfButtonBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (TapActionBlock)actionBlock {
    return objc_getAssociatedObject(self, &keyOfButtonBlock);
}
@end
