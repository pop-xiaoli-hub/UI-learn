//
//  ViewController.m
//  UIViewController
//
//  Created by xiaoli pop on 2025/5/26.
//

#import "ViewController.h"
#import "ViewC02.h"
@interface ViewController ()

@end

@implementation ViewController

//第一次程序加载视图时调用，只能加载一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"viewDidLoad第一次加载视图");
}




/*
 当我们的视图控制器即将显示时调用次函数
 视图分为：1.显示前（不显示）2.正在处于显示状态 3.已经被隐藏
 参数：表示是否有动画切换后显示
 每一次视图显示时都要被调用
 */
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear即将显示");
}
 
/*
 视图即将消失调用此函数
 参数：表示是否动画切换后消失
 当前的状态：视图还是显示在屏幕上的
 */
- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear视图即将消失");
}

//*****animated表示视图即将消失的过程是否是用动画，他有两种可能的值YES or NO******

/*
 当视图已经显示到屏幕后的瞬间调用次函数
 参数：表示是否用动画切换显示的
 当前状态已经显示到屏幕上了
 */
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear当前视图已经显示");
}

/*
 当前视图已经从屏幕上消失了
 参数：表示是否用动画来切换的
 当前视图已经从屏幕上消失
 */
- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"veiwDidDisappear视图已经消失");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewC02* vc = [[ViewC02 alloc] init];
    /*
     显示一个新的视图控制器界面到屏幕上
     参数：
     p1：新的控制器对象
     p2：是否使用动画效果
     p3:切换结束后功能调用，如果不需要就直接传空
     */
    [self presentViewController:vc animated:YES completion:nil];
}

@end
