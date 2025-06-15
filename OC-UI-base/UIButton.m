//
//  ViewController.m
//  UIButton
//
//  Created by xiaoli pop on 2025/5/22.
//

/*
 1.UIButton控件的基本概念
 2.UIButton的创建方法
 3.UIBuuton的类型
 4.可显示图片的UIButton
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//创建普通的UIButton按钮函数
- (void)creatUIRectButton {
    //创建圆角类型按钮
    //通过类方法来创建（button的内存是自己管理的）
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //设置位置
    button.frame = CGRectMake(150, 100, 100, 40);
    
    //显示文字
    //@paramemter
    //p1: 字符串类型，表示显示到按钮上的文字
    //p2: 设置文字显示的状态类型；UIControlStateNormal：正常状态
    //为不同状态设置不同文本
    [button setTitle:@"按钮01" forState:UIControlStateNormal];
    //p1:显示的文字
    //p2:显示文字的状态；UIControlStateHighlighted：按下状态
    [button setTitle:@"按钮按下" forState:UIControlStateHighlighted];
    //背景颜色
    button.backgroundColor = [UIColor yellowColor];
    //文字颜色
    //p1:颜色
    //p2:状态
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    //设置按钮的风格颜色
    //[button setTintColor:[UIColor whiteColor]];
    //设置字体大小
    button.titleLabel.font = [UIFont systemFontOfSize:18.0];
    //添加到视图中并显示
    [self.view addSubview:button];
}

- (void)creatImageButton {
    //创建一个自定义类型button
    UIButton* buttonImage = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonImage.frame = CGRectMake(150, 200, 100, 100);
    //从应用束资源束中加载图片文件并创建UIImage对象
    UIImage* icon01 = [UIImage imageNamed:@"button01.jpg"];
    UIImage* icon02 = [UIImage imageNamed:@"button02.jpg"];
    //p1:显示图片对象
    //p1:按钮状态
    [buttonImage setImage:icon01 forState:UIControlStateNormal];
    [buttonImage setImage:icon02 forState:UIControlStateHighlighted];
    [self.view addSubview:buttonImage];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatUIRectButton];
    
    [self creatImageButton];
}


@end
