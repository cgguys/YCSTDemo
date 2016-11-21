//
//  BaseRequest.h
//  YCSTDemo
//
//  Created by nan gu on 16/10/19.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GNRequestMethod) {
    GNRequestMethodGET,
    GNRequestMethodPOST
};

@interface BaseRequest : NSObject

@property (nonatomic, copy) NSString * gn_host;
@property (nonatomic, copy) NSString * gn_url;
@property (nonatomic, assign) NSInteger gn_requestMethod;

- (NSURLSessionDataTask *)stratRequestWithSuccess:(ResponseBlock)success fail:(ResponseBlock)fail expcetion:(ResponseExpcetionBlock)expcetion;


@end
