# WdyStatusBarHUD
一个非常简单好用的上面弹出的指示器，覆盖状态栏和导航条
## 显示成功信息
```objc
[WdyStatusBarHUD showSuccess:@"加载成功"];
```

## 显示失败信息
```objc
[WdyStatusBarHUD showError:@"加载失败"];
```

## 显示正在加载信息
```objc
[WdyStatusBarHUD showLoading:@"加载中"];
```

## 显示普通信息
```objc
[WdyStatusBarHUD showMessage:@"你说你想怎么玩" image:nil];
```

## 隐藏指示器
```objc
[WdyStatusBarHUD hideStatusBarHUD];
```