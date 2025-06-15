//
//  ViewController.m
//  UIView
//
//  Created by xiaoli pop on 2025/5/24.
//

/*
 UIView的层级关系
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建三个视图对象
    UIView* view01 = [[UIView alloc] init];
    view01.frame = CGRectMake(100, 100, 150, 150);
    view01.backgroundColor = [UIColor blueColor];
    UIView* view02 = [[UIView alloc] init];
    view02.frame = CGRectMake(125, 125, 150, 150);
    view02.backgroundColor = [UIColor orangeColor];
    UIView* view03 = [[UIView alloc] init];
    view03.frame = CGRectMake(150, 150, 150, 150);
    view03.backgroundColor = [UIColor greenColor];
    
    //显示到屏幕上，受父亲视图管理
    //哪一个视图被限添加到父亲视图中，就先绘制哪一个视图
    [self.view addSubview:view01];
    [self.view addSubview:view02];
    [self.view addSubview:view03];
    
    //将某一个子视图调整到最前面
    [self.view bringSubviewToFront:view01];
    //参数：UIview对象
    //将某一个子视图调整到最后面显示
    [self.view sendSubviewToBack:view01];
    
    //subview：是管理所有self.view的子视图的数组
    UIView* viewFront = self.view.subviews[2];
    [view01 removeFromSuperview];
    
    UIView* viewBack = self.view.subviews[0];
    
    if (view01 == viewBack) {
        NSLog(@"相等");
    }
}


@end
