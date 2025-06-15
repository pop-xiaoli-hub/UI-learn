//
//  ViewC02.m
//  UIViewController
//
//  Created by xiaoli pop on 2025/5/26.
//

#import "ViewC02.h"

@interface ViewC02 ()

@end

@implementation ViewC02

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置控制器2的颜色
    self.view.backgroundColor = [UIColor orangeColor];
    
}

//当点击当前控制器二的界面屏幕时
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*
     使当前的控制器消失掉
     参数：
     p1:是否有动画效果
     p2:是否调用块中函数
     */
    [self dismissViewControllerAnimated:YES completion:nil];
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



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
