//
//  MenuItem.h
//  POP动画引擎
//
//  Created by yuanwei on 15/5/16.
//  Copyright (c) 2015年 YuanWei. All rights reserved.
//

// ==========================================
//  MenuItem 菜单元素  数据模型  Model
// ==========================================


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuItem : NSObject

/**
 *  @brief 标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  @brief  配图
 */
@property (nonatomic, strong) UIImage *iconImage;

/**
 *
 */
@property (nonatomic, strong) UIColor *glowColor;

/**
 *  @brief  按钮index
 */
@property (nonatomic, assign) NSUInteger index;


//实例方法
- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor;

//类方法
+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor;

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSUInteger)index;

@end
