//
//  GlowButton.m
//  POP动画引擎
//
//  Created by yuanwei on 15/5/16.
//  Copyright (c) 2015年 YuanWei. All rights reserved.
//

#import "GlowButton.h"

@implementation GlowButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self =[super initWithFrame:frame]) {
        [self setUpProperty];
    }
    return self;
}

/**
 *  设置阴影的颜色
 */
- (void)setGlowColor:(UIColor *)newGlowColor {
    _glowColor = newGlowColor;
    self.layer.shadowColor = newGlowColor.CGColor;
}

/**
 *   根据阴影 设置图层 默认属性
 */
- (void)setUpProperty {
    self.layer.shadowColor   = [UIColor grayColor].CGColor;
    self.layer.shadowPath    = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-5, -5, CGRectGetWidth(self.bounds) + 10, CGRectGetHeight(self.bounds) + 10) cornerRadius:(CGRectGetHeight(self.bounds) + 10) / 2.0].CGPath;
    self.layer.shadowOffset  = CGSizeMake(0.0, 0.0);
    self.layer.shadowOpacity = 0.5;
    self.layer.masksToBounds = NO;
}

@end
