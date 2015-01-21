//
//  CUSShimmerAnimation.m
//  ShimmerAnimation
//
//  Created by wangjun on 15-1-21.
//  Copyright (c) 2015年 wangjun. All rights reserved.
//

#import "CUSShimmerAnimation.h"

static NSString *animationKey = @"CUSShimmerAnimationKey";

@interface CUSShimmerAnimation()

@property (nonatomic, assign) BOOL shimmerAnimationing;
@property (nonatomic, strong) CABasicAnimation *shimmerBasicAnimation;

@end

@implementation CUSShimmerAnimation

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self commitUI];
    }
    return self;
}

- (void)commitUI
{
    self.shadowBackgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
    self.shadowForegroundColor = [UIColor whiteColor];
    
    self.shadowWidth = 20.0;
    self.repeatCount = HUGE_VALF;
    self.duration = 2.0;
}

#pragma mark - Private Method
- (CAGradientLayer *)shimmerLayerMask
{
    CAGradientLayer *gradientMask = [CAGradientLayer layer];
    gradientMask.frame = self.animationView.bounds;
    
    CGFloat gradientPercentage = self.shadowWidth / self.animationView.frame.size.width;
    
    NSArray *startLocations = @[@0,
                                [NSNumber numberWithFloat:(gradientPercentage / 2.0)],
                                [NSNumber numberWithFloat:gradientPercentage]];
    NSArray *endLocations = @[[NSNumber numberWithFloat:(1 - gradientPercentage)],
                              [NSNumber numberWithFloat:(1 - gradientPercentage / 2.0)],
                              @1];
    
    gradientMask.colors = @[(id)self.shadowBackgroundColor.CGColor,
                            (id)self.shadowForegroundColor.CGColor,
                            (id)self.shadowBackgroundColor.CGColor];
    gradientMask.locations = startLocations;
    gradientMask.startPoint = CGPointMake(0 - (gradientPercentage * 2), 0.5);
    gradientMask.endPoint = CGPointMake(1 + gradientPercentage, 0.5);
    
    self.shimmerBasicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    _shimmerBasicAnimation.fromValue = startLocations;
    _shimmerBasicAnimation.toValue = endLocations;
    _shimmerBasicAnimation.duration = self.duration;
    _shimmerBasicAnimation.repeatCount = self.repeatCount;
    _shimmerBasicAnimation.delegate = self;
    
    [gradientMask addAnimation:_shimmerBasicAnimation forKey:animationKey];
    
    return gradientMask;
}

#pragma mark - Public Method
- (void)starShimmerAnimation
{
    if (!self.animationView) return;
    if (self.shimmerAnimationing) return;
    
    [self stopShimmerAnimation];
    
    self.animationView.layer.mask = [self shimmerLayerMask];
    
    self.shimmerAnimationing = YES;
}

- (void)stopShimmerAnimation
{
    if (self.animationView && self.animationView.layer.mask)
    {
        [self.animationView.layer.mask removeAnimationForKey:animationKey];
        self.animationView.layer.mask = nil;
        self.shimmerBasicAnimation = nil;
        
        self.shimmerAnimationing = NO;
    }
}

- (BOOL)isAnimationing
{
    return self.shimmerAnimationing;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag)
    {
        [self stopShimmerAnimation];
    }
}

@end
