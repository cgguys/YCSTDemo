//
//  DFRouter.h
//  DFRouterDemo
//
//  Created by 如佳 陈 on 16/6/29.
//  Copyright © 2016年 rongzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const DFRouterScheme;
extern NSString *const DFRouterParamSepartor;
extern NSString *const DFRouterEqual;
extern NSString *const DFRouterAnd;

@protocol DFRouter <NSObject>

@optional
+ (instancetype)getInstance;

- (void)setParams:(NSDictionary *)params;

@end

typedef void(^DFPreparePresentBlock)(UIViewController *target);

@interface DFRouter : NSObject

+ (instancetype)sharedRouter;

+ (void)registerURL:(NSString *)urlString forViewController:(Class)clazz;

+ (UIViewController*)pageWithURL:(NSString*)urlString;

+ (UIViewController*)pageWithURL:(NSString*)urlString withNav:(BOOL)nav;

+ (UIViewController*)pageWithURL:(NSString*)urlString withNav:(BOOL)nav withParams:(NSDictionary*)params;

+ (id)openURL:(NSString *)urlString;

+ (id)openURL:(NSString *)urlString withParams:(NSDictionary *)params;

+ (id)openURL:(NSString *)urlString withParams:(NSDictionary *)params preparePresent:(DFPreparePresentBlock)block animated:(BOOL)animated finish:(void (^)(void))completion;

@end
