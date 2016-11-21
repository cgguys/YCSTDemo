//
//  DFHeader.m
//  MJRefreshExample
//
//  Created by Apple on 16/3/31.
//  Copyright © 2016年 小码哥. All rights reserved.
//
//#define FLYIMAGE _flyImageView.image.size

#define IMAGEWIDTH(X) (X).image.size.width
#define IMAGEHEIGHT(X) (X).image.size.height


#import "DFHeader.h"
@interface DFHeader()
@property (strong, nonatomic)UIImageView *backgroundImageView;
@property (strong, nonatomic)UIImageView *cityImageView;
@property (strong, nonatomic)UIImageView *flyImageView;
@property (strong, nonatomic)UIImageView *ferrisWheelImageView;

@end
@implementation DFHeader

- (void)prepare
{
    [super prepare];
    
    self.mj_h = 80;
    _backgroundImageView = [[UIImageView alloc] init];
    _backgroundImageView.image = [UIImage imageNamed:@"DFrefresh_bg"];
    [self addSubview:_backgroundImageView];
    
    _ferrisWheelImageView = [[UIImageView alloc] init];
    _ferrisWheelImageView.image = [UIImage imageNamed:@"DFrefresh_ferriswheel"];
    [self addSubview:_ferrisWheelImageView];
    
    _cityImageView = [[UIImageView alloc] init];
    _cityImageView.image = [UIImage imageNamed:@"DFrefresh_castle"];
    [self addSubview:_cityImageView];
    
    _flyImageView = [[UIImageView alloc] init];
    _flyImageView.image = [UIImage imageNamed:@"DFrefresh_flyImage"];
    [self addSubview:_flyImageView];
}

//设置位置
- (void)setPullingPercent:(CGFloat)pullingPercent {
    [super setPullingPercent:pullingPercent];
    NSLog(@"%@", @(self.state));
    if (self.state == 1) {
        CGFloat rate = 50.0*(1.0-pullingPercent*2)+50;
        //金钱豹
        _flyImageView.frame = CGRectMake((self.mj_w-IMAGEWIDTH(_flyImageView))*.5,(self.mj_h-IMAGEHEIGHT(_flyImageView))*.45,IMAGEWIDTH(_flyImageView), IMAGEHEIGHT(_flyImageView));
        _flyImageView.layer.timeOffset = pullingPercent;
        //背景
        _backgroundImageView.frame = CGRectMake((self.mj_w-IMAGEWIDTH(_backgroundImageView))/2, self.mj_h-IMAGEHEIGHT(_backgroundImageView)+rate, IMAGEWIDTH(_backgroundImageView), IMAGEHEIGHT(_backgroundImageView));
        //城堡
        _cityImageView.frame = CGRectMake((self.mj_w-IMAGEWIDTH(_cityImageView))/2, self.mj_h-IMAGEHEIGHT(_cityImageView)+rate+2, IMAGEWIDTH(_cityImageView), IMAGEHEIGHT(_cityImageView));
        
        //摩天轮
        _ferrisWheelImageView.frame = CGRectMake((self.mj_w-IMAGEWIDTH(_ferrisWheelImageView))*2/5, self.mj_h-IMAGEHEIGHT(_ferrisWheelImageView)+rate, IMAGEWIDTH(_ferrisWheelImageView), IMAGEHEIGHT(_ferrisWheelImageView));
    }else {
        _flyImageView.frame = CGRectMake((self.mj_w-IMAGEWIDTH(_flyImageView))*.5,(self.mj_h-IMAGEHEIGHT(_flyImageView))*.45,IMAGEWIDTH(_flyImageView), IMAGEHEIGHT(_flyImageView));
        //背景
        _backgroundImageView.frame = CGRectMake((self.mj_w-IMAGEWIDTH(_backgroundImageView))/2, self.mj_h-IMAGEHEIGHT(_backgroundImageView), IMAGEWIDTH(_backgroundImageView), IMAGEHEIGHT(_backgroundImageView));
        
        _cityImageView.frame = CGRectMake((self.mj_w-IMAGEWIDTH(_cityImageView))/2, self.mj_h-IMAGEHEIGHT(_cityImageView)+2, IMAGEWIDTH(_cityImageView), IMAGEHEIGHT(_cityImageView));
        //摩天轮
        _ferrisWheelImageView.frame = CGRectMake((self.mj_w-IMAGEWIDTH(_ferrisWheelImageView))*2/5,self.mj_h-IMAGEHEIGHT(_ferrisWheelImageView), IMAGEWIDTH(_ferrisWheelImageView), IMAGEHEIGHT(_ferrisWheelImageView));
    }
}

- (void)setState:(MJRefreshState)state
{
    [super setState:state];
    NSLog(@"--------%@",@(state));
    
    switch (state) {
        case MJRefreshStateIdle:
        {
            [self playPullingAnimation];
            
        }
            break;
        case MJRefreshStatePulling:
        {
            [_flyImageView.layer removeAllAnimations];
            _flyImageView.layer.speed = 1;
            [self playShakingAnimation];
        }
            break;
        case MJRefreshStateRefreshing:
        {
            [_flyImageView.layer removeAllAnimations];
            _flyImageView.layer.speed = 1;
            [self playShakingAnimation];
        }
            break;
        case MJRefreshStateWillRefresh:
        {
            
        }
        default:
            break;
    }
}

#pragma mark - Animation
//下拉动画
- (void)playPullingAnimation
{
    //飞
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    [aPath moveToPoint:CGPointMake(-[UIScreen mainScreen].bounds.size.width*.2, self.mj_h*1.5)];
    [aPath addQuadCurveToPoint:CGPointMake([UIScreen mainScreen].bounds.size.width*.5, self.mj_h*.45) controlPoint:CGPointMake([UIScreen mainScreen].bounds.size.width*.21, self.mj_h*.45)];
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.path = aPath.CGPath;
    anim.duration = 1.0;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    anim.rotationMode = kCAAnimationRotateAuto;
    anim.delegate = self;
    [anim setValue:@"supermanPull" forKey:@"pull"];
    [_flyImageView.layer addAnimation:anim forKey:@"position"];
    
    //由小变大
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim2.fromValue = [NSValue valueWithCGSize:CGSizeMake(.2, .2)];
    anim2.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    anim2.duration = 1.0;
    anim2.fillMode = kCAFillModeForwards;
    anim2.removedOnCompletion = NO;
    [_flyImageView.layer addAnimation:anim2 forKey:@"transform.scale"];
    
    //淡出
    CABasicAnimation *anim3 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim3.fromValue = @(.0);
    anim3.toValue = @(1.0);
    anim3.duration = 0.5;
    anim3.fillMode = kCAFillModeForwards;
    anim3.removedOnCompletion = NO;
    [_flyImageView.layer addAnimation:anim3 forKey:@"opacity"];
    
    _flyImageView.layer.speed = 0;
    _flyImageView.layer.timeOffset = 0;
    
    
}

//刷新时动画
- (void)playShakingAnimation
{
    //上下浮动
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.values = @[[NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.45)],
                    [NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.45+10)],
                    [NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.45)],
                    [NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.45-10)],
                    [NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.45)]];
    anim.duration = 2.0;
    anim.repeatCount = CGFLOAT_MAX;
    anim.fillMode = kCAFillModeForwards;
    anim.removedOnCompletion = NO;
    [_flyImageView.layer removeAllAnimations];
    [_flyImageView.layer addAnimation:anim forKey:@"position"];
    
    //摩天轮转动
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim2.toValue = @(M_PI*2);
    anim2.repeatCount = CGFLOAT_MAX;
    anim2.duration = 2.0;
    anim2.fillMode = kCAFillModeForwards;
    anim2.removedOnCompletion = NO;
    [_ferrisWheelImageView.layer addAnimation:anim2 forKey:@"transform.rotation.z"];
    
}

//结束动画
- (void)playDidStopRefreshAnimation
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.values = @[[NSValue valueWithCGPoint:CGPointMake(self.mj_w*.5, self.mj_h*.45)],
                    [NSValue valueWithCGPoint:CGPointMake(self.mj_w, self.mj_h*.75)]];
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anim2.fromValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    anim2.toValue = [NSValue valueWithCGSize:CGSizeMake(.2, .2)];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = @[anim, anim2];
    animGroup.duration = .25;
    animGroup.fillMode = kCAFillModeForwards;
    animGroup.removedOnCompletion = NO;
    animGroup.delegate = self;
    [animGroup setValue:@"supermanFinish" forKey:@"name"];
    [_flyImageView.layer addAnimation:animGroup forKey:nil];
}

- (void)endRefreshing
{
    [self playDidStopRefreshAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.state = MJRefreshStateIdle;
    });
}

@end
