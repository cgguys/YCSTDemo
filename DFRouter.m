//
//  DFRouter.m
//  DFRouterDemo
//
//  Created by 如佳 陈 on 16/6/29.
//  Copyright © 2016年 rongzi. All rights reserved.
//

#import "DFRouter.h"
#import <objc/runtime.h>
//#import <MJExtension/MJExtension.h>
#import "MainTabBarController.h"
#import "AppDelegate+GNAdd.h"

NSString *const DFRouterScheme = @"dfstock://";
NSString *const DFRouterParamSepartor = @"?";
NSString *const DFRouterEqual = @"=";
NSString *const DFRouterAnd = @"&";

@interface DFRouter()

@property (nonatomic, strong) NSMutableDictionary<NSString*,Class> *routerInfo;

@end

@implementation DFRouter

+ (instancetype)sharedRouter {
    static DFRouter *router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[DFRouter alloc] init];
    });
    return router;
}

+ (void)registerURL:(NSString *)urlString forViewController:(Class)clazz {
    Protocol *protocol = NSProtocolFromString(@"DFRouter");
    if (!class_conformsToProtocol(clazz, protocol)) {
        class_addProtocol(clazz, protocol);
    }
    [DFRouter sharedRouter].routerInfo[urlString] = clazz;
}

+ (UIViewController*)pageWithURL:(NSString *)urlString {
    UIViewController *target = [self _setupVcWithURL:urlString withParams:nil];
    return target;
}

+ (UIViewController *)pageWithURL:(NSString *)urlString withNav:(BOOL)nav {
    return [self pageWithURL:urlString withNav:nav withParams:nil];
}

+ (UIViewController *)pageWithURL:(NSString *)urlString withNav:(BOOL)nav withParams:(NSDictionary *)params {
    UIViewController *target = [self _setupVcWithURL:urlString withParams:params];
    if (nav) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:target];
        return nav;
    }
    return target;
}

+ (id)openURL:(NSString *)urlString {
    NSArray <NSString*>*arr = [urlString componentsSeparatedByString:DFRouterParamSepartor];
    NSMutableDictionary *params = @{}.mutableCopy;
    if (arr.count > 1) {
        for (NSString *string in [arr[1] componentsSeparatedByString:DFRouterAnd]) {
            NSString *key = [string componentsSeparatedByString:DFRouterEqual][0];
            NSString *value = [string componentsSeparatedByString:DFRouterEqual][1];
            [params setObject:value forKey:key];
        }
    }
    return [self openURL:arr[0] withParams:params];
}

+ (id)openURL:(NSString *)urlString withParams:(NSDictionary*)params{
    UIViewController<DFRouter> *target = [self _setupVcWithURL:urlString withParams:params];
    
    UIViewController *currentVC = ApplicationDelegate.gn_topViewController;
    if ([currentVC isKindOfClass:[MainTabBarController class]]) {
        currentVC = ((MainTabBarController*)currentVC).selectedViewController;
    }
    if ([currentVC isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController*)currentVC pushViewController:target animated:YES];
    }else {
        [currentVC.navigationController pushViewController:target animated:YES];
    }
    
    return target;
}

+ (id)openURL:(NSString *)urlString withParams:(NSDictionary *)params preparePresent:(DFPreparePresentBlock)block animated:(BOOL)animated finish:(void (^ _Nullable)(void))completion {
    UIViewController<DFRouter> *target = [self _setupVcWithURL:urlString withParams:params];
    if (!target) {
        return nil;
    }

    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:target];
    if (block) {
        block(navi);
    }
    UIViewController *currentVC = ApplicationDelegate.gn_topViewController;
    if (currentVC.navigationController) {
        [currentVC.navigationController presentViewController:navi animated:YES completion:completion];
    }else {
        [currentVC presentViewController:navi animated:animated completion:completion];
    }
    
    return target;
}

+ (UIViewController<DFRouter> *)_setupVcWithURL:(NSString*)urlString withParams:(NSDictionary*)params {
    Class clazz = [DFRouter sharedRouter].routerInfo[urlString];
    UIViewController<DFRouter> *target;
    if (class_getClassMethod(clazz, @selector(getInstance))) {
        target = [clazz getInstance];
    }else {
        target = [[clazz alloc] init];
    }
    if ([target respondsToSelector:@selector(setParams:)]) {
        [target setParams:params];
    }else {
//        [target mj_setKeyValues:params];
        [target setValuesForKeysWithDictionary:params];
    }
    return target;
}

- (NSMutableDictionary *)routerInfo {
    if (!_routerInfo) {
        _routerInfo = [[NSMutableDictionary alloc] init];
    }
    return _routerInfo;
}

@end
