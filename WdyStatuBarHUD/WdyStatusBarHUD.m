//
//  WdyStatusBarHUD.m
//  状态栏指示器
//
//  Created by 王冬尧 on 16/5/30.
//  Copyright © 2016年 PuXin. All rights reserved.
//

#import "WdyStatusBarHUD.h"

#define WdyMessageFont [UIFont systemFontOfSize:14]
/** 消息停留时间 */
static CGFloat const WdyMessageDuration = 2.0;
/** 消失显示动画时间 */
static CGFloat const WdyAnimationDuration = 0.25;

@implementation WdyStatusBarHUD




/** 全局窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/**
 * 显示窗口
 */
+ (void)showWindow
{
    
    /** 先让窗口隐藏 */
    window_.hidden = YES;
    
    
    /** frame的数据 */
    CGFloat windowH = 64;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    /** 显示窗口 */
    window_ = [[UIWindow alloc] init];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    /** 动画 */
    frame.origin.y = 0;
    [UIView animateWithDuration:WdyAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
    
}

+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    /** 添加窗口 */
    [self showWindow];
    /** 停止定时器 */
    [timer_ invalidate];
    
    /** 添加按钮 */
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    button.titleLabel.font = WdyMessageFont;
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [button setTitle:msg forState:UIControlStateNormal];
    [window_ addSubview:button];
    
    /** 定时消失 */
    timer_ = [NSTimer scheduledTimerWithTimeInterval:WdyMessageDuration target:self selector:@selector(hideStatusBarHUD) userInfo:nil repeats:NO];

}

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"WdyStatusHUD.bundle/cheak"]];
}
/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg
{
   [self showMessage:msg image:[UIImage imageNamed:@"WdyStatusHUD.bundle/error"]];
}

/**
 * 显示加载信息
 */
+ (void)showLoading:(NSString *)msg
{
    
    /** 停止定时器 */
    [timer_ invalidate];
    timer_ = nil;
    
    /** 添加窗口 */
    [self showWindow];
    
    
    /** 添加按钮 */
    UILabel *label = [[UILabel alloc] init];
    label.font = WdyMessageFont;
    label.textColor = [UIColor whiteColor];
    label.frame = window_.bounds;
    label.text = msg;
    label.textAlignment = 1;
    [window_ addSubview:label];
    
    /** 添加圈圈 */
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : WdyMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height/2;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
}

/**
 * 隐藏
 */
+ (void)hideStatusBarHUD
{
    [UIView animateWithDuration:WdyAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];

}







@end
