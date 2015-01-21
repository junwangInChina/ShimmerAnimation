//
//  ViewController.m
//  ShimmerAnimation
//
//  Created by wangjun on 15-1-21.
//  Copyright (c) 2015年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import "CUSShimmerAnimation.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIButton *clickButton;
@property (nonatomic, strong) CUSShimmerAnimation *shimmerAnimation;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.clickButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.clickButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    self.shimmerAnimation = [[CUSShimmerAnimation alloc] init];
    self.shimmerAnimation.animationView = self.clickButton;
    [self.shimmerAnimation starShimmerAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shimmerAnimation:(id)sender
{
    if ([self.shimmerAnimation isAnimationing])
    {
        [self.shimmerAnimation stopShimmerAnimation];
    }
    else
    {
        [self.shimmerAnimation starShimmerAnimation];
    }
}

@end
