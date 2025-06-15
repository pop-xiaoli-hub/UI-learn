

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//定时器的属性对象
@property (retain, nonatomic) NSTimer* timerView;
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
//属性与成员变量同步
//@synthesize timerView = _timerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 80, 40);
    
    [button setTitle:@"启动定时器" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    
    UIButton* buttonstop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonstop.frame = CGRectMake(100, 200, 80, 40);
    buttonstop.backgroundColor = [UIColor purpleColor];
    [buttonstop setTitle:@"停止计时器" forState:UIControlStateNormal];
    [buttonstop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonstop];
    
    UIView* view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, 80, 80);
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    
    
    //设置view的标签值
    //通过父视图对象以及view的标签值可以获得相应的视图对象
    view.tag = 101;
    
}

//按下开始按钮时调用
- (void)pressStart {
    /*
     NSTimer类方法创建一个定时器并且启动这个定时器
     p1:间隔时间，以秒为单位
     p2:表示实现定时器函数的对象
     p3:表示定时器函数对象
     p4:定时器函数中的一个参数没有参数可以传nil
     p5:表示定时器是否可以重复
     返回值：一个新建好的定时器对象
     */
    if (_timerView != nil) {
        [_timerView invalidate];
    }
    _timerView = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer:) userInfo:@"小明say" repeats:YES];
}

- (void)updateTimer:(NSTimer*) timer{
    NSLog(@"%@你是彭于晏",timer.userInfo);
    
    UIView* view = [self.view viewWithTag:101];
    view.frame =CGRectMake(view.frame.origin.x+1, view.frame.origin.y+1, 80, 80);
}

//按下停止按钮时调用
- (void)pressStop {
    if (_timerView != nil) {
        [_timerView invalidate];
    }
}

@end
