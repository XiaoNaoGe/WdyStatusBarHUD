//
//  WdyStatusBarHUD.h
//  状态栏指示器
//
//  Created by 王冬尧 on 16/5/30.
//  Copyright © 2016年 PuXin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WdyStatusBarHUD : NSObject

/**
 * 显示普通信息
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 * 显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 * 显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 * 显示加载信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 * 隐藏
 */
+ (void)hideStatusBarHUD;

@end
