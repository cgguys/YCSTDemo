//
//  ResponseHead.h
//  YCSTDemo
//
//  Created by nan gu on 16/10/14.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseHead : NSObject

@property (nonatomic, assign) NSInteger ret;

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, assign) NSInteger codeNumber;

@property (nonatomic, copy) NSString* msg;

@end
