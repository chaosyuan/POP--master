//
//  MenuView.m
//  POP动画引擎
//
//  Created by yuanwei on 15/5/16.
//  Copyright (c) 2015年 YuanWei. All rights reserved.
//

#import "MenuView.h"
#import <POP.h>
#import "MenuItem.h"    // Model
#import "GlowButton.h"  // View

@interface MenuView()

@property (nonatomic, strong) GlowButton *iconbutton;
@property (nonatomic, strong) MenuItem *menuItem;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame menuItem:(MenuItem *)menuItem {
    self = [super initWithFrame:frame];
    if (self) {
    
        _menuItem   = menuItem;
        _iconbutton = [[GlowButton alloc] initWithFrame:CGRectMake(0, 0, menuItem.iconImage.size.width, menuItem.iconImage.size.height)];
        _iconbutton.userInteractionEnabled = NO;
        [_iconbutton setImage:menuItem.iconImage forState:UIControlStateNormal];
        _iconbutton.glowColor = menuItem.glowColor;
        _iconbutton.center    = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(_iconbutton.bounds));
        [self addSubview:_iconbutton];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_iconbutton.frame), CGRectGetWidth(self.bounds), 35)];
        _titleLabel.text               = menuItem.title;
        _titleLabel.textColor          = [UIColor whiteColor];
        _titleLabel.font               = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment      = NSTextAlignmentCenter;
        _titleLabel.backgroundColor    = [UIColor clearColor];
        CGPoint center = _titleLabel.center;
        center.x = CGRectGetMidX(self.bounds);
        _titleLabel.center = center;
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 底部弹出时的动画
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animation];
    scaleAnimation.springBounciness    = 20;    // value between 0-20  Defaults to 4
    scaleAnimation.springSpeed         = 20;     // value between 0-20
    scaleAnimation.property            = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    scaleAnimation.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.3, 1.3)];
    [self pop_addAnimation:scaleAnimation forKey:@"scaleAnimationKey"];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self disMissCompleted:NULL];
}

- (void)disMissCompleted:(void(^)(BOOL finished))completed {

    // 从界面向下消失时的动画
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animation];
    scaleAnimation.springBounciness    = 16;      // value between 0-20
    scaleAnimation.springSpeed         = 14;     // value between 0-20
    scaleAnimation.property            = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    scaleAnimation.toValue             = [NSValue valueWithCGSize:CGSizeMake(1.0, 1.0)];
    scaleAnimation.completionBlock     = ^(POPAnimation *anim, BOOL finished) {
        if (completed) {
            completed(finished);
        }
    };
    [self pop_addAnimation:scaleAnimation forKey:@"scaleAnimationKey"];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // 回调
    [self disMissCompleted:^(BOOL finished) {
        if (self.didSelctedItemCompleted) {
            self.didSelctedItemCompleted(self.menuItem);
        }
    }];
}

@end
