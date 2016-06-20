//
//  ViewController.m
//  POP动画引擎
//
//  Created by yuanwei on 15/5/15.
//  Copyright (c) 2015年 YuanWei. All rights reserved.
//

/**
 *
 *   此动画基于Facebook动画引擎。
 *   慢慢了解pop引擎，希望再次引擎上自定制动画
 */

#import "ViewController.h"
#import <POP.h>
#import "PopMenu.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;

@property (nonatomic, strong) PopMenu *popMenu;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)click:(id)sender
{
    [self showMenu];
}
- (void)showMenu {
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    
    MenuItem *menuItem = [MenuItem itemWithTitle:@"微信" iconName:@"share_wx_friends" glowColor:[UIColor colorWithRed:0.314f green:0.729f blue:0.310f alpha:0.800f]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"朋友圈" iconName:@"share_wx_timeline" glowColor:[UIColor colorWithRed:0.549f green:0.714f blue:0.259f alpha:0.800f]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"短信" iconName:@"share_sms" glowColor:[UIColor colorWithRed:0.329f green:0.643f blue:0.173f alpha:0.800f]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"QQ" iconName:@"share_qq" glowColor:[UIColor colorWithRed:0.322f green:0.580f blue:0.851f alpha:0.800f]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"QQ空间" iconName:@"share_qzone" glowColor:[UIColor colorWithRed:0.102f green:0.498f blue:0.831f alpha:0.800f]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"新浪微博" iconName:@"share_weibo" glowColor:[UIColor colorWithRed:0.953f green:0.584f blue:0.188f alpha:0.800f]];
    [items addObject:menuItem];
    
    
    if (!_popMenu) {
        _popMenu = [[PopMenu alloc] initWithFrame:self.view.bounds items:items];
        _popMenu.menuAnimationType = kPopMenuAnimationTypeNetEase;
    }
    if (_popMenu.isShowed) {
        return;
    }

     //回调
    [self.popMenu setDidSelectedItemCompletion:^(MenuItem *selectedItem){
    
        NSLog(@"%@",selectedItem.title);
    }];
    
    [_popMenu showMenuAtView:self.view];
    
//   [_popMenu showMenuAtView:self.view
//                  startPoint:CGPointMake(CGRectGetWidth(self.view.bounds) - 60, CGRectGetHeight(self.view.bounds))
//                    endPoint:CGPointMake(60, CGRectGetHeight(self.view.bounds))];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
