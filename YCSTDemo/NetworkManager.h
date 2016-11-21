//
//  NetworkManager.h
//  YCSTDemo
//
//  Created by nan gu on 16/10/14.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseHead.h"

typedef void(^ResponseBlock)(NSURLSessionTask *task ,ResponseHead *head,id content);
typedef void(^ResponseExpcetionBlock)(NSURLSessionTask *task ,NSError *error);

@interface NetworkManager : NSObject

+ (instancetype)shareManager;

- (NSURLSessionDataTask *)POST:(NSString *)apiURLString parameters:(NSDictionary *)parameters success:(ResponseBlock)successBlock fail:(ResponseBlock)failBlock expcetion:(ResponseExpcetionBlock)expcetionBolck;

- (NSURLSessionDataTask *)GET:(NSString *)apiURLString parameters:(NSDictionary *)parameters success:(ResponseBlock)successBlock fail:(ResponseBlock)failBlock expcetion:(ResponseExpcetionBlock)expcetionBolck;

@end
