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
    //滑动条
   
    _slider = [[UISlider alloc] init];
    _slider.frame = CGRectMake(10, 400, 200, 20);
    _slider.maximumTrackTintColor = [UIColor blueColor];
    _slider.minimumTrackTintColor = [UIColor orangeColor];
    [self.view addSubview:_slider];
    
    _stepper = [[UIStepper alloc] init];
    //宽高不可改变
    _stepper.frame = CGRectMake(100, 100, 80, 40);
    //设置最值
    _stepper.minimumValue = 0;
    _stepper.maximumValue = 100;
    //设置当前值
    _stepper.value = 10;
    //步进值
    _stepper.stepValue = 1;
    //是否可以重复响应事件操作
    _stepper.autorepeat = YES;
    /*
     是否可以将步进结果通过事件函数响应出来
     就是说会不会同步响应
     */
    _stepper.continuous = YES;
    //添加一个事件函数
    [_stepper addTarget:self action:@selector(stepChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_stepper];
        
    //创建分栏控件
    _segControl = [[UISegmentedControl alloc] init];
    //宽度可变，高度不可变
    _segControl.frame = CGRectMake(10, 300, 300, 40);
    /*
     添加一个按钮元素
     参数：
     1.按钮文字
     2.按钮位置
     3.是否有插入的动画效果
     */
    [_segControl insertSegmentWithTitle:@"安康" atIndex:0 animated:NO];
    [_segControl insertSegmentWithTitle:@"西安" atIndex:1 animated:NO];
    [_segControl insertSegmentWithTitle:@"延安" atIndex:2 animated:NO];
    [_segControl insertSegmentWithTitle:@"宝鸡" atIndex:3 animated:NO];
    
    //设置选择默认按钮索引
    _segControl.selectedSegmentIndex = 0;
    //添加响应事件
    [_segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: _segControl];
    
    
}
- (void)stepChange:(UIStepper*)step {
    NSLog(@"%f", step.value);
}

- (void)segChange {
    NSLog(@"%@", [_segControl titleForSegmentAtIndex:_segControl.selectedSegmentIndex]);
}
@end
