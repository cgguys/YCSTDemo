//
//  BaseRequest.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/19.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "BaseRequest.h"
#import "NetworkManager.h"

@implementation BaseRequest

- (NSString *)gn_host {
#ifdef DEBUG
    return @"http://";
#else
    return @"http://";
#endif
}

- (NSURLSessionDataTask *)stratRequestWithSuccess:(ResponseBlock)success fail:(ResponseBlock)fail expcetion:(ResponseExpcetionBlock)expcetion {
    NetworkManager *manager = [NetworkManager shareManager];
    NSString *urlString = [NSString stringWithFormat:@"%@%@",self.gn_host,self.gn_url];
    NSDictionary *params = [self gn_getAllPropertiesAndVaules];
    
    switch (self.gn_requestMethod) {
        case GNRequestMethodGET:
            return [manager GET:urlString parameters:params success:success fail:fail expcetion:expcetion];
            break;
        case GNRequestMethodPOST:
            return [manager POST:urlString parameters:params success:success fail:fail expcetion:expcetion];
            break;
        default:
            break;
    }
    return nil;
}




@end
