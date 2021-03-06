//
//  UIColor+Extension.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/26.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)colorWithString:(NSString *)colorName {
    
    unsigned int redInt_, greenInt_, blueInt_;
    NSRange rangeNSRange_;
    rangeNSRange_.length = 2;  // 范围长度为2
    
    // 取红色的值
    rangeNSRange_.location = 0;
    [[NSScanner scannerWithString:[colorName substringWithRange:rangeNSRange_]] scanHexInt:&redInt_];
    // 取绿色的值
    rangeNSRange_.location = 2;
    [[NSScanner scannerWithString:[colorName substringWithRange:rangeNSRange_]] scanHexInt:&greenInt_];
    
    // 取蓝色的值
    rangeNSRange_.location = 4;
    [[NSScanner scannerWithString:[colorName substringWithRange:rangeNSRange_]] scanHexInt:&blueInt_];
    
    return [UIColor colorWithRed:(float)(redInt_/255.0f) green:(float)(greenInt_/255.0f) blue:(float)(blueInt_/255.0f) alpha:1.0f];
}

@end
