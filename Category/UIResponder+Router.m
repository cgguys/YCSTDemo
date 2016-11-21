//
//  UIResponder+Router.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/10.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(id)userInfo {
    
    return [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
    
}

@end
