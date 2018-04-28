# SHAutoUpdatedTool
一行代码自动检查是否需要版本更新, 并提示点击跳转appStore更新app
我们的app需要有一个自动检查是否最新版本, 如果不是最新版本则需要提示用户去AppStore更新app的功能, 如下图  

![update.png](https://upload-images.jianshu.io/upload_images/3275951-946cb340677cb092.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
.
我的SHAutoUpdatedTool可以提供此功能方法直接使用, 但是暂时是用系统的AlertView来提示用户更新, 如果需要用比较好看的AlertView来展示, 则需要修改.m文件里面标注的代码, 将自定义的AlertView放进去.
### 使用方法:
将 SHAutoUpdatedTool 文件夹直接拖进项目中, 在需要检查更新提示的地方写以下代码, 其中需要传入appID, 即app上架到AppStore后会有一个appID, 如下:
```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 检查自动更新
    [SHAutoUpdatedManager sh_checkIfPushToAppStoreWithAppID:@"1305679109"];
}
```

### 实现思路:
1.获取本机应用版本号
2.获取AppStore上应用版本号
3.对比, 不一致就提示更新

简书地址求打赏:
https://www.jianshu.com/p/4348a9610d03
