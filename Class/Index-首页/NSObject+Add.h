//
//  NSObject+Add.h
//  YCSTDemo
//
//  Created by nan gu on 16/10/18.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Add)

+ (void)swizzleMethod:(SEL)originalSelector andAnotherSelecor:(SEL)swizzledSelector;

- (NSDictionary *)gn_getAllPropertiesAndVaules;

@end
