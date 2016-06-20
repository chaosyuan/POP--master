//
//  MenuItem.m
//  POP动画引擎
//
//  Created by yuanwei on 15/5/16.
//  Copyright (c) 2015年 YuanWei. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

//类方法
+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor {
    
    MenuItem *item = [[self alloc ] initWithTitle:title
                                         iconName:iconName
                                        glowColor:glowColor];
    return item;
}

//实例化方法
- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor {
    
    if ( self = [super init]) {
        _title     = title;
        _iconImage = [UIImage imageNamed:iconName];
        _glowColor = glowColor;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSUInteger)index {
    
    MenuItem *item =  [self initWithTitle:title
                                 iconName:iconName
                                glowColor:glowColor];
    item.index     = index;
    return item;
}

@end
