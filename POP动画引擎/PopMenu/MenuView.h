//
//  MenuView.h
//  POP动画引擎
//
//  Created by yuanwei on 15/5/16.
//  Copyright (c) 2015年 YuanWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuItem;

typedef void(^DidSelctedItemCompletedBlock)(MenuItem *menuItem);

@interface MenuView : UIView

@property (nonatomic, copy) DidSelctedItemCompletedBlock didSelctedItemCompleted;

- (instancetype)initWithFrame:(CGRect)frame menuItem:(MenuItem *)menuItem;

@end
