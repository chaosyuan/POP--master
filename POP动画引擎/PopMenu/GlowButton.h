//
//  GlowButton.h
//  POP动画引擎
//
//  Created by yuanwei on 15/5/16.
//  Copyright (c) 2015年 YuanWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlowButton : UIButton

/**
*  @brief  设置阴影的偏移值（+，+）表示向左下偏移 默认为 （0,0）
*/
@property (nonatomic, assign) CGSize glowOffset;

/**
 *  @brief 设置阴影的模糊度 默认为： 5
 */
@property (nonatomic, assign) CGFloat glowAmount;

/**
 *  @brief  设置阴影的颜色 默认为 grayColor 灰色
 */
@property (nonatomic, strong) UIColor *glowColor;

@end
