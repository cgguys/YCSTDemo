//
//  UIResponder+Router.h
//  YCSTDemo
//
//  Created by nan gu on 16/10/10.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(id)userInfo;

@end
