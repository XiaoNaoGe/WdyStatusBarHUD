//
//  ViewController.m
//  状态栏指示器
//
//  Created by 王冬尧 on 16/5/30.
//  Copyright © 2016年 PuXin. All rights reserved.
//

#import "ViewController.h"
#import "WdyStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
    
}

- (IBAction)success:(UIButton *)sender {
    [WdyStatusBarHUD showSuccess:@"加载成功"];
}


- (IBAction)error:(UIButton *)sender {
    [WdyStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(UIButton *)sender {
    [WdyStatusBarHUD showLoading:@"加载中"];
}


- (IBAction)hide:(UIButton *)sender {
    [WdyStatusBarHUD hideStatusBarHUD];
}

- (IBAction)message:(UIButton *)sender {
    [WdyStatusBarHUD showMessage:@"你说你想怎么玩" image:nil];
}

@end
