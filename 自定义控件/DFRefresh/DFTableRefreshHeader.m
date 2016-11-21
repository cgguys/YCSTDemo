//
//  DFTableRefreshHeader.m
//  MJRefreshExample
//
//  Created by Apple on 16/4/18.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#define IMAGEWIDTH(X) (X).image.size.width
#define IMAGEHEIGHT(X) (X).image.size.height


#import "DFTableRefreshHeader.h"
@interface DFTableRefreshHeader()
@property (strong, nonatomic)UIImageView *backgroundImageView;
@property (strong, nonatomic)UIImageView *backgroundImageView2;
@property (strong, nonatomic)UIImageView *sunImageView;
@property (strong, nonatomic)UIImageView *backWheelImageView;
@property (strong, nonatomic)UIImageView *carImageView;
@property (strong, nonatomic)UIImageView *frontWheelImageView;

@end
@implementation DFTableRefreshHeader

- (void)prepare
{
    [super prepare];
    
    self.mj_h = 80;
    _backgroundImageView = [[UIImageView alloc] init];
    _backgroundImageView.image = [UIImage imageNamed:@"tableviewRefresh_city"];
    [self addSubview:_backgroundImageView];
    
    _backgroundImageView2 = [[UIImageView alloc] init];
    _backgroundImageView2.image = [UIImage imageNamed:@"tableviewRefresh_city"];
    [_backgroundImageView addSubview:_backgroundImageView2];
    
    _sunImageView = [[UIImageView alloc] init];
    _sunImageView.image = [UIImage imageNamed:@"tableviewRefresh_sun"];
    [self addSubview:_sunImageView];
    
    _carImageView = [[UIImageView alloc] init];
    _carImageView.image = [UIImage imageNamed:@"tableviewRefresh_car"];
    [self addSubview:_carImageView];
    
    _frontWheelImageView = [[UIImageView alloc] init];
    _frontWheelImageView.image = [UIImage imageNamed:@"tableviewRefresh_wheel"];
    [_carImageView addSubview:_frontWheelImageView];
    
    _backWheelImageView = [[UIImageView alloc] init];
    _backWheelImageView.image = [UIImage imageNamed:@"tableviewRefresh_wheel"];
    [_carImageView addSubview:_backWheelImageView];
    
    
}


- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
//    NSLog(@"%@", @(self.state));
//    NSLog(@"%lf",pullingPercent);

    //后轮
    _backWheelImageView.frame = CGRectMake(_carImageView.image.size.width*.065, _carImageView.image.size.height*.71, IMAGEWIDTH(_backWheelImageView), IMAGEHEIGHT(_backWheelImageView));
    
    //前轮
    _frontWheelImageView.frame = CGRectMake(_carImageView.image.size.width*.683, _carImageView.image.size.height*.70, IMAGEWIDTH(_frontWheelImageView), IMAGEHEIGHT(_frontWheelImageView));
    //背景
    _backgroundImageView.frame = CGRectMake(0, self.mj_h*.4, IMAGEWIDTH(_backgroundImageView), IMAGEHEIGHT(_backgroundImageView));
    _backgroundImageView2.frame = CGRectMake(IMAGEWIDTH(_backgroundImageView), 0,IMAGEWIDTH(_backgroundImageView), IMAGEHEIGHT(_backgroundImageView));
    _sunImageView.frame = CGRectMake(self.mj_w*.7,self.mj_h*.15,IMAGEWIDTH(_sunImageView), IMAGEHEIGHT(_sunImageView));
    
    _carImageView.frame = CGRectMake(.5*(self.mj_w+IMAGEWIDTH(_carImageView))*pullingPercent-IMAGEWIDTH(_carImageView),self.mj_h*.5,IMAGEWIDTH(_carImageView), IMAGEHEIGHT(_carImageView));
    
}

- (void)setState:(MJRefreshState)state
{
    [super setState:state];
    NSLog(@"%@",@(state));
    
    switch (state) {
        case MJRefreshStateIdle:
        {
            [_carImageView.layer removeAllAnimations];
//            [_backgroundImageView.layer removeAllAnimations];
        }
            break;
        case MJRefreshStatePulling:
        {
            [self playShakingAnimation];
        }
            break;
        case MJRefreshStateRefreshing:
        {
            [self playShakingAnimation];
            CAKeyframeAnimation *anim4 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            anim4.values = @[[NSValue valueWithCGPoint:CGPointMake(IMAGEWIDTH(_backgroundImageView)/2, self.mj_h*.4+IMAGEHEIGHT(_backgroundImageView)/2)],
                             [NSValue valueWithCGPoint:CGPointMake(-IMAGEWIDTH(_backgroundImageView)/2, self.mj_h*.4+IMAGEHEIGHT(_backgroundImageView)/2)]];
            anim4.repeatCount = CGFLOAT_MAX;
            anim4.duration = 8.0;
            anim4.fillMode = kCAFillModeForwards;
            anim4.removedOnCompletion = NO;
            [_backgroundImageView.layer addAnimation:anim4 forKey:@"position"];
        }
            break;
        case MJRefreshStateWillRefresh:
            break;
        default:
            break;
    }
}

#pragma mark - Animation

- (void)playShakingAnimation
{
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.values = @[[NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.5+IMAGEHEIGHT(_carImageView)*.5)],
                    [NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.5+IMAGEHEIGHT(_carImageView)*.5+.5)],
                    [NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.5+IMAGEHEIGHT(_carImageView)*.5)],
                    ];
    anim.duration = 2.0;
    anim.repeatCount = CGFLOAT_MAX;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    [_carImageView.layer removeAllAnimations];
    [_carImageView.layer addAnimation:anim forKey:@"position"];
    
    CAKeyframeAnimation *anim2 = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim2.values = @[@(0),@(-M_PI/64),@(0)];
    anim2.duration = .5;
    anim2.repeatCount = CGFLOAT_MAX;
    anim2.fillMode = kCAFillModeForwards;
    anim2.removedOnCompletion = NO;
    [_carImageView.layer addAnimation:anim2 forKey:@"transform.rotation.z"];
    
    
    CABasicAnimation *anim3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim3.toValue = @(M_PI*4);
    anim3.repeatCount = CGFLOAT_MAX;
    anim3.duration = 2.0;
    anim3.fillMode = kCAFillModeForwards;
    anim3.removedOnCompletion = NO;
    [_frontWheelImageView.layer addAnimation:anim3 forKey:@"transform.rotation.z"];
    [_backWheelImageView.layer addAnimation:anim3 forKey:@"transform.rotation.z"];
    
    
    
    CABasicAnimation *anim5 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim5.toValue = @(M_PI);
    anim5.repeatCount = CGFLOAT_MAX;
    anim5.duration = 2.0;
    anim5.fillMode = kCAFillModeForwards;
    anim5.removedOnCompletion = NO;
    [_sunImageView.layer addAnimation:anim5 forKey:@"transform.rotation.z"];
    
}

- (void)playDidStopRefreshAnimation
{
    _carImageView.frame = CGRectMake(.5*(self.mj_w+IMAGEWIDTH(_carImageView))-IMAGEWIDTH(_carImageView),self.mj_h*.5,IMAGEWIDTH(_carImageView), IMAGEHEIGHT(_carImageView));
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.values = @[[NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.5+IMAGEHEIGHT(_carImageView)*.5)],
                    [NSValue valueWithCGPoint:CGPointMake(self.mj_w, self.mj_h*.5+IMAGEHEIGHT(_carImageView)*.5)]];
    anim.duration = .25;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.delegate = self;
    [anim setValue:@"supermanFinish" forKey:@"name"];
    [_carImageView.layer addAnimation:anim forKey:nil];
}

- (void)endRefreshing
{
    [self playDidStopRefreshAnimation];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([[anim valueForKey:@"name"] isEqualToString:@"supermanFinish"]) {
        self.state = MJRefreshStateIdle;
    }
}

@end
