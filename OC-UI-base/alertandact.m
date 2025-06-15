#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
/*
 定义一个警告对话框视图对象
 */
@property(nonatomic, retain)UIAlertController* alertcontroller;
/*
 当下载。或者加载比较大的文文件时，可以显示此控件，处于提示等待状态
 */
@property(nonatomic, retain)UIActivityIndicatorView* activityIndicator;
@end


//
//  ViewController.m
//  UIearn
//
//  Created by xiaoli pop on 2025/5/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
 

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    /*
     创建两个按钮
     */
    for (int i = 0; i < 2; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(150, 100 + 100 * i, 100, 40);
        if (!i) {
            [button setTitle:@"警告对话框" forState:UIControlStateNormal];
        } else if (i == 1) {
            [button setTitle:@"等待对话框" forState:UIControlStateNormal];
        }
        button.backgroundColor = [UIColor greenColor];
        button.tag = 101 + i;
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
  
}

- (void)pressButton:(UIButton*)button {
    // 警告对话框
    if (button.tag == 101) {
        _alertcontroller = [UIAlertController alertControllerWithTitle:@"警告" message:@"手机电量过低" preferredStyle:UIAlertControllerStyleAlert];
        //添加一个取消按钮
        UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        //将取消按钮添加到对话框中
        [_alertcontroller addAction:cancleAction];
    
        UIAlertAction* newAction = [UIAlertAction actionWithTitle:@"新的" style:UIAlertActionStyleDefault handler:nil];
        [_alertcontroller addAction:newAction];
        
        //添加一个确认按钮
        UIAlertAction* confirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了确认按钮");
        }];
        [_alertcontroller addAction:confirmAction];
        [self presentViewController:_alertcontroller animated:YES completion:nil];
    } else if (button.tag == 102) {
        //创建等待提示器
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(157, 300, 100, 100)];
        //设置提示风格
        _activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
        [self.view addSubview:_activityIndicator];
        //启动动画并显示
        [_activityIndicator startAnimating];
    }
}
@end
