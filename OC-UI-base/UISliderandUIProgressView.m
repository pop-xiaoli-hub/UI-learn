
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//进度条定义
@property(nonatomic, retain)UIProgressView* progressView;
//滑动条定义
@property(nonatomic, retain)UISlider* slider;
@end

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //进度条创建
    _progressView = [[UIProgressView alloc] init];
    //进度条位置大小设置（高度不可调）
    _progressView.frame = CGRectMake(50, 100, 300, 40);
    //设置风格颜色值
    _progressView.progressTintColor = [UIColor redColor];
    _progressView.trackTintColor = [UIColor yellowColor];
    //设置进度条的进度值
    //范围0-1
    _progressView.progress = 0.3;
    //设置进度条风格特征
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    [self.view addSubview:_progressView];
    
    
    //滑动条创建
    _slider = [[UISlider alloc] init];
    _slider.frame = CGRectMake(20, 200, 350, 40);
    //设置滑动条最大值
    _slider.maximumValue = 100;
    //最小值(可以为负值)
    _slider.minimumValue = 0;
    //设置滑块位置（去取决于最大最小值）float类型
    _slider.value = 40;
    //左侧滑动条的背景颜色
    _slider.minimumTrackTintColor = [UIColor blueColor];
    //右侧滑动条的背景颜色
    _slider.maximumTrackTintColor = [UIColor yellowColor];
    //设置滑块的颜色
    _slider. thumbTintColor = [UIColor orangeColor];
    //对滑动条添加事件函数
    //UIControlEventValueChanged:变化就调用
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_slider];
}

- (void) pressSlider {
    /*
     进度条与滑动条同步
     */
    //_progressView.progress = _slider.value; //范围相同
    _progressView.progress = (_slider.value - _slider.minimumValue) / (_slider.maximumValue - _slider.minimumValue);
    NSLog(@"value = %f", _slider.value);
}
@end
