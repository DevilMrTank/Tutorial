//
//  CTabBar.m
//  crd
//
//  Created by 笔记本 on 2017/10/12.
//  Copyright © 2017年 crd. All rights reserved.
//

#import "CTabBar.h"

@implementation CTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    CGFloat cellSize = TableBarHeight + 10;
    
    if (self = [super initWithFrame:frame]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(MainScreenWidth / 2 - cellSize / 2, - 10, cellSize, cellSize);
        [btn setBackgroundImage:ImageNamed(@"60.png") forState:UIControlStateNormal];
        [btn setBackgroundImage:ImageNamed(@"120.png") forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
    return self;
}

- (void)btnAction {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(tabBarDidClickCenterButton:)]) {
        [self.adDelegate tabBarDidClickCenterButton:self];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.width / 5;
    int index = 0;
    for (UIControl *control in self.subviews) {
        if (![control isKindOfClass:[UIControl class]] || [control isKindOfClass:[UIButton class]]) {
            continue;
        }
        control.width = width;
        control.x = index > 1 ? width * (index + 1) : width * index;
        index ++;
    }
}

@end
