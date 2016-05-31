# WdyStatusBarHUD
简单方便的上面弹出的指示器，覆盖导航条状态栏
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
