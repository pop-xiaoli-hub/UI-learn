//
//  ViewController.m
//  UIButton
//
//  Created by xiaoli pop on 2025/5/22.
//



#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*
 1.创建圆角按钮，创建思路：选择按钮类型type、摄制框架frame、设置状态标签setTitle、摄制背景颜色backgroud、设置字体颜色setTitleColor、设置字体大小、添加到视图中显示
 */
- (void)creatUIButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(150, 200, 100, 40);
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button setTitle:@"退出成功" forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor yellowColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor systemPinkColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [self.view addSubview: button];
}

- (void)creatImageButton {
    UIButton* buttonImage = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonImage.frame = CGRectMake(150, 300, 100, 40);
    UIImage* icon01 = [UIImage imageNamed:@"button01.jpg"];
    UIImage* icon02 = [UIImage imageNamed:@"button02.jpg"];
    [buttonImage setImage:icon01 forState:UIControlStateNormal];
    [buttonImage setImage:icon02 forState:UIControlStateHighlighted];
    [self.view addSubview:buttonImage];
}
- (void)creatButton {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor yellowColor];
    button.frame = CGRectMake(150, 100, 100, 40);
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    /*
     为按钮添加响应时间逻辑
     1. target常见取值：
            self：当前视图控制器或视图
            nil：使用响应链寻找处理方法
            其他对象
            会对target产生弱引用，不会阻止target被释放，但若target释放后，按钮仍然可能触发事件（需要手动移除target）
     2. action：
            事件触发时调用的方法，必须是target对象中实现的方法
     3. controlEvents：
            出发事件的条件
     */
    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    
    /*
     如果事件函数带参数，那么不同按钮调用时会有区别
     button.tag = 101;
     */
    button.tag = 101;
    UIButton* button02 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button02.tag = 102;
    button02.frame = CGRectMake(150, 400, 100, 40);
    [button02 setTitle:@"修改密码" forState:UIControlStateNormal];
    [button02 setTitle:@"请修改密码" forState:UIControlStateHighlighted];
    button02.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button02 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button02 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button02.backgroundColor = [UIColor yellowColor];
    button02.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [button02 addTarget:self action:@selector(modifyPassword) forControlEvents:UIControlEventTouchUpInside];
    [button02 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button02];
}

/*
- (void)pressButton {
    NSLog(@"按钮被按下");
}
*/

//参数调用此函数按钮对象本身
- (void)pressButton:(UIButton* )button {
    if (button.tag == 101) {
        NSLog(@"button01 is pressed");
    }
    if (button.tag == 102) {
        NSLog(@"button02 is pressed");
    }
}

//触碰时调用事件函数
- (void)touchDown {
    NSLog(@"按钮被触碰");
}

//修改密码触碰后调用函数
- (void)modifyPassword {
    NSLog(@"请输入新密码");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatButton];
    [self creatUIButton];
    [self creatImageButton];
}


@end
