//
//  NSDictionary+Add.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/19.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "NSDictionary+Add.h"

@implementation NSDictionary (Add)

- (NSString *)stringWithJSONFormat {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return nil;
    }
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return json;
}

@end
