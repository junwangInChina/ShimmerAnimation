//
//  CUSShimmerAnimation.h
//  ShimmerAnimation
//
//  Created by wangjun on 15-1-21.
//  Copyright (c) 2015年 wangjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CUSShimmerAnimation : NSObject

@property (nonatomic, weak) UIView *animationView;
@property (nonatomic, strong) UIColor *shadowBackgroundColor;
@property (nonatomic, strong) UIColor *shadowForegroundColor;
@property (nonatomic, assign) CGFloat shadowWidth;
@property (nonatomic, assign) CGFloat repeatCount;
@property (nonatomic, assign) NSTimeInterval duration;

/**
 *  开始动画
 */
- (void)starShimmerAnimation;

/**
 *  结束动画
 */
- (void)stopShimmerAnimation;

/**
 *  判断是否正在执行动画
 *
 *  @return 返回bool值判断
 */
- (BOOL)isAnimationing;

@end
