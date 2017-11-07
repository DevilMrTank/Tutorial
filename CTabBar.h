//
//  CTabBar.h
//  crd
//
//  Created by 笔记本 on 2017/10/12.
//  Copyright © 2017年 crd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CTabBar;

@protocol CTabBarDelegate <NSObject>

- (void)tabBarDidClickCenterButton:(CTabBar *)tabBar;

@end

@interface CTabBar : UITabBar

@property (nonatomic, weak) id<CTabBarDelegate> adDelegate;

@end
