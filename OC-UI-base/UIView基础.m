//
//  ViewController.m
//  UIView
//
//  Created by xiaoli pop on 2025/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView* view = [[UIView alloc] init];
    view.frame = CGRectMake(160, 150, 100, 200);
    view.backgroundColor = [UIColor orangeColor];
    //将新建的视图添加到父亲的视图上
    //过程：1.将新建的视图添加到屏幕上；2.将视图作为父亲视图的子视图管理起来
    [self.view addSubview:view];
    
    //隐藏视图
    //YES为隐藏；默认为NO显示
    view.hidden = YES;
    
    //设置视图的透明度
    // = 1:不透明 ； = 0：透明 ；= 0.5:半透明
    view.alpha = 0.5;
    self.view.backgroundColor = [UIColor blueColor];
    
    //设置是否显示不透明
    view.opaque = NO;
    
    //将自己从父亲视图删除
    //1.从父亲的管理视图中删除
    //2.不会显示在屏幕上
    [view removeFromSuperview];
}


@end
