
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
/*
 定义一个开关控件
 可以进行状态的改变
 所有UIKit框架库中的控件均以UI开头
 苹果官方的控件都定义在UIKit框架库中
 */
@property(nonatomic, retain)UISwitch* mySwitch;
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
    // Do any additional setup after loading the view.
    
    /*
     创建一个开关对象
     继承与UIView
     */
    _mySwitch = [[UISwitch alloc]init];
    
    /*
     苹果官方的控件的位置设置
     位置x、y的值可以改变
     宽高无法改变
     */
    _mySwitch.frame = CGRectMake(100, 100, 80, 40);
    
    /*
     开关状态设置属性
     */
    _mySwitch.on = YES; //默认状态
    [_mySwitch setOn:YES animated:YES];
    //_mySwitch.backgroundColor = [UIColor yellowColor];
    /*
     添加视图显示
     */
    [self.view addSubview:_mySwitch];
    //设置开启状态风格颜色
    //[_mySwitch setOnTintColor:[UIColor redColor]];
    //设置开关圆按钮的风格颜色
    //[_mySwitch setThumbTintColor:[UIColor greenColor]];
    //设置整体风格颜色
    //[_mySwitch setTintColor:[UIColor orangeColor]];
    
    /*
     响应事件
     UIControlEventValueChanged:状态发生变化触发
     */
    [_mySwitch addTarget:self action:@selector(swChange:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)swChange :(UISwitch*) sw{
    //on表示当前结束后的状态
    if (sw.on == YES) {
        NSLog(@"开关被打开");
    } else {
        NSLog(@"开关被关闭");
    }
}
@end
