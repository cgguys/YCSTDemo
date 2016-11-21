//
//  NetworkManager.m
//  YCSTDemo
//
//  Created by nan gu on 16/10/14.
//  Copyright © 2016年 nan gu. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "ResponseHead.h"

@implementation NetworkManager

+ (instancetype)shareManager {
    static NetworkManager *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[NetworkManager alloc] init];
    });
    return instance;
}

- (NSURLSessionDataTask *)POST:(NSString *)apiURLString parameters:(NSDictionary *)parameters success:(ResponseBlock)successBlock fail:(ResponseBlock)failBlock expcetion:(ResponseExpcetionBlock)expcetionBolck {
    
    AFHTTPSessionManager *manager = [self wrapedSessionManager];
    LogGreen(@"[POST]:%@",apiURLString);
    LogGreen(@"[PARAMS]:%@",[parameters stringWithJSONFormat]);
    
    return [manager POST:apiURLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ResponseHead *head = [ResponseHead mj_objectWithKeyValues:responseObject[@"Head"]];
        if (head.ret == 0) {
            if (successBlock) {
                LogGreen(@"[Response]:%@",[responseObject stringWithJSONFormat]);
                successBlock(task,head,responseObject[@"Content"]);
            }
        }else {
            if (failBlock) {
                LogRed(@"[Response]:%@",[responseObject stringWithJSONFormat]);
                failBlock(task,head,responseObject[@"Content"]);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (expcetionBolck) {
            LogRed(@"[Exception]:%@", error.description);
            expcetionBolck(task,error);
        }
    }];
}

- (NSURLSessionDataTask *)GET:(NSString *)apiURLString parameters:(NSDictionary *)parameters success:(ResponseBlock)successBlock fail:(ResponseBlock)failBlock expcetion:(ResponseExpcetionBlock)expcetionBolck {
    
    AFHTTPSessionManager *manager = [self wrapedSessionManager];
    LogGreen(@"[GET]:%@",apiURLString);
    LogGreen(@"[PARAMS]:%@",[parameters stringWithJSONFormat]);
    
    return [manager GET:apiURLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ResponseHead *head = [ResponseHead mj_objectWithKeyValues:responseObject[@"Head"]];
        if (head.ret == 0) {
            if (successBlock) {
                LogGreen(@"[Response]:%@",[responseObject stringWithJSONFormat]);
                successBlock(task,head,responseObject[@"Content"]);
            }
        }else {
            if (failBlock) {
                LogRed(@"[Response]:%@",[responseObject stringWithJSONFormat]);
                failBlock(task,head,responseObject[@"Content"]);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (expcetionBolck) {
            LogRed(@"[Exception]:%@", error.description);
            expcetionBolck(task,error);
        }
    }];
}

- (AFHTTPSessionManager *)wrapedSessionManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSInteger userId = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultUserID];
    NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:kUserDegaultToken];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    if (token) {
        [manager.requestSerializer setValue:@(userId).stringValue forHTTPHeaderField:@"UserId"];
        [manager.requestSerializer setValue:token forHTTPHeaderField:@"Token"];
        LogGreen(@"UserId:%@ \n Token:%@",@(userId),token);
    }
    return manager;
}

@end
