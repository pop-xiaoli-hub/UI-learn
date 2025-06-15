//
//  SceneDelegate.m
//  UIView
//
//  Created by xiaoli pop on 2025/5/25.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    /*
     UIWindow是iOS中的一个界面对象，用于表示和管理应用程序的窗口，他通常包含应用程序的视图层次结构的背景，并且是所有视图控制器和视图的容器。在应用程序中，UIWindow对象在屏幕上扮演一个至关重要的角色，他负责协调视图对象的展示与事件的响应
     是iOS应用程序中最底层的界面对象，是应用程序可视化的载体，所有视图与视图控制器都必须加载到UIWindow中，才能最终显示在屏幕上
     协调事件响应，当用户触摸屏幕时，系统会自动生成一个UIEvent（触摸事件），并首先传递给UIWindow
     以下现实场景：
     1.消息推送弹窗：消息的悬浮通知
     2.多任务多窗口：多窗口独立
     3.游戏中的弹窗菜单：游戏应用中常需要暂停游戏并弹出设置菜单
     4.全屏广告：应用程序中的全屏广告通常会在新的UIWindow中修显示
     */
    
    /*
     视图控制器：
     简称VC是MVC模式的核心组件，负责管理视图（view）与数据（Model）之间的交互逻辑（导演）
     主要功能：
     1.创建和管理视图
     VC负责创建或加载视图，并定义视图的布局
     
     2.视图生命周期的管理
     VC控制视图的显示与隐藏，并在不同阶段触发特定的方法，用于执行界面更新或资源释放
     
     3.事件响应
     VC监听用户操作（如按钮点击、滑动手势），并调用相应的处理方法
     
     4.数据与界面的绑定
     VC从Model层获取数据，并更新提交到View中（如从网络请求获取用户信息后，填充到界面的文本框），同时将用户输出的数据传递给Model层
     
     5.页面跳转（导航）
     VC通过协调不同界面之间的切换逻辑
     
     6.父子控制器关系
     复杂界面可通过容器视图管理器管理子控制器
     
     
     视图：负责界面元素的展示，如按钮、文本框、图片等
     
     数据：村醋界面元素需要展示的内容，如用户信息，网络请求结果等。
     */



    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    self.window.rootViewController = [[UIViewController alloc] init];
    
    self.window.backgroundColor = [UIColor blueColor];
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    view.backgroundColor = [UIColor colorWithRed:0.2 green:0.3 blue:0.5 alpha:0];
    UIView* backview = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    backview.backgroundColor = [UIColor orangeColor];
    [backview addSubview:view];
    
    /*
     子视图的坐标参照父亲视图的坐标
     当父亲视图移动时，所有的子视图都会移动
     */
    
    [self.window addSubview:backview];
    
    /*
     每一个view都有一个window属性
     打印出结果发现地址都相同，说明是同一个window
     当我们把子视图添加到父视图上时，会将父视图的window赋给子视图的window
     */
    NSLog(@"%@",view.window);
    NSLog(@"%@",backview.window);
    NSLog(@"%@",self.window);
    
    /*
     <UIWindow: 0x10590f1d0; frame = (0 0; 402 874); hidden = YES; gestureRecognizers = <NSArray: 0x600000c6dbc0>; backgroundColor = UIExtendedSRGBColorSpace 0 0 1 1; layer = <UIWindowLayer: 0x600000c69f20>>
     <UIWindow: 0x10590f1d0; frame = (0 0; 402 874); hidden = YES; gestureRecognizers = <NSArray: 0x600000c6dbc0>; backgroundColor = UIExtendedSRGBColorSpace 0 0 1 1; layer = <UIWindowLayer: 0x600000c69f20>>
     <UIWindow: 0x10590f1d0; frame = (0 0; 402 874); hidden = YES; gestureRecognizers = <NSArray: 0x600000c6dbc0>; backgroundColor = UIExtendedSRGBColorSpace 0 0 1 1; layer = <UIWindowLayer: 0x600000c69f20>>
     */
    
    [self.window makeKeyAndVisible];
    
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
