#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
@property(nonatomic, retain)UILabel* Username;
@property(nonatomic, retain)UILabel* Password;
@property(nonatomic, retain)UITextField* TextOfUserName;
@property(nonatomic, retain)UITextField* TextOfPassword;
@property(nonatomic, retain)UIButton* LoginOfButton;
@property(nonatomic, retain)UIButton* RegistOfButton;
@property(nonatomic, retain)UIScrollView* scrollView;
@end

//
//  ViewController.m
//  Login
//
//  Created by xiaoli pop on 2025/5/28.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc] init];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    _scrollView.frame = CGRectMake(0, 65, screenBounds.size.width, screenBounds.size.height * 0.75);
    //取消弹动效果
    _scrollView.bounces = NO;
    /*
     是否允许通过点击屏幕让滚动视图响应事件
     YES：滚动视图可以接受触碰事件
     NO：不接受触碰事件
     */
    //_scrollView.userInteractionEnabled = NO;
    _scrollView.contentSize = CGSizeMake(screenBounds.size.width , screenBounds.size.height * 5 * 0.75);
    for (int i = 1; i <= 5; i++) {
        NSString* strName = [NSString stringWithFormat:@"photo0%d.jpg",i];
        UIImage* image = [UIImage imageNamed:strName];
        UIImageView* iview = [[UIImageView alloc] initWithImage:image];
        //设置图像在滚动视图画布中的位置
        iview.frame = CGRectMake(0, screenBounds.size.height * (i - 1) * 0.75, screenBounds.size.width, screenBounds.size.height);
        [_scrollView addSubview:iview];
    }
    [self.view addSubview:_scrollView];
    //滚动视图画布的移动位置，（偏移位置）
    //决定画布显示的最终图像结果
    _scrollView.contentOffset = CGPointMake(0, 0);
    _scrollView.pagingEnabled = NO;
    _scrollView.delegate = self;
    
}

//当滚动视图移动时，只要offet坐标发生变化，都会调用此函数
//可以使用次函数监控滚动视图的位置
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"y = %f", scrollView.contentOffset.y);
}

//当滚动视图结束拖动时调用次函数
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"Did End Drag");
}

//滚动视图即将开始被拖动时
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"Will begin Drag");
}

//视图即将结束拖动时调用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"Will end Drag");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"Will Begin Decelereting");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"视图停止移动");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    //_scrollView.contentOffset = CGPointMake(0, 0);
    [_scrollView scrollRectToVisible:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height) animated:YES];
}

@end


///*
//    定义并创建一个滚动视图
//    可以对视图内容进行滚屏查看功能
//*/
//UIScrollView* sv = [[UIScrollView alloc] init];
///*
// 设置滚动视图的位置，使用矩形来定位视图位置
// */
//CGRect screenBounds = [[UIScreen mainScreen] bounds];
//sv.frame = screenBounds;
///*
// 是否按照整页来滚动视图
// */
//sv.pagingEnabled = YES;
///*
// 是否开启滚动效果
// */
//sv.scrollEnabled = YES;
///*
// 设置画布大小，画布显示在滚动视图内部，一般大于Frame的大小
// */
//sv.contentSize = CGSizeMake(screenBounds.size.width * 5, screenBounds.size.height);
///*
// 是否开启边缘弹动效果
// */
//sv.bounces = YES;
///*
// 开启横向弹动效果
// */
//sv.alwaysBounceHorizontal = YES;
///*
// 开启纵向弹动效果
// */
//sv.alwaysBounceVertical = YES;
///*
// 开启横向显示滚动条
// */
//sv.showsHorizontalScrollIndicator = YES;
///*
// 开启纵向显示滚动条
// */
//sv.showsVerticalScrollIndicator = YES;
//sv.backgroundColor = [UIColor yellowColor];
//for (int i = 1; i <= 5; i++) {
//    NSString* strName = [NSString stringWithFormat:@"photo0%d.jpg",i];
//    UIImage* image = [UIImage imageNamed:strName];
//    UIImageView* iview = [[UIImageView alloc] initWithImage:image];
//    iview.frame = CGRectMake(screenBounds.size.width * (i - 1), 0, screenBounds.size.width, screenBounds.size.height);
//    [sv addSubview:iview];
//}
//[self.view addSubview:sv];












/*
 
 - (void)viewDidLoad {
     [super viewDidLoad];
     // Do any additional setup after loading the view.
     _Username = [self creatLabel:@"用户名" andframe:CGRectMake(30, 150, 80, 40)];
     [self.view addSubview:_Username];
     _Password = [self creatLabel:@"密码" andframe:CGRectMake(30, 220, 80, 40)];
     [self.view addSubview:_Password];
     
     _TextOfUserName = [self creatTextField:@"请输入用户名" andframe:CGRectMake(120, 150, 200, 40) andencypt:NO];
     [self.view addSubview:_TextOfUserName];
     _TextOfPassword = [self creatTextField:@"请输入密码" andframe:CGRectMake(120, 220, 200, 40) andencypt:YES];
     [self.view addSubview:_TextOfPassword];
     
     _LoginOfButton = [self creatButton:@"点击登陆" andframe:CGRectMake(150, 300, 100, 40) andState: UIControlStateNormal];
     [self.view addSubview:_LoginOfButton];
     [_LoginOfButton addTarget:self action:@selector(pressLoginButton) forControlEvents:UIControlEventTouchUpInside];
     _RegistOfButton = [self creatButton:@"点击注册" andframe:CGRectMake(150, 350, 100, 40) andState:UIControlStateNormal];
     [self.view addSubview:_RegistOfButton];
     [_RegistOfButton addTarget:self action:@selector(pressRegistButton) forControlEvents:UIControlEventTouchUpInside];
 }

 - (UILabel* )creatLabel:(NSString* )TextOfLabel andframe:(CGRect)cgrect {
     UILabel* TypeOfLabel = [[UILabel alloc] init];
     TypeOfLabel.frame = cgrect;
     TypeOfLabel.text = TextOfLabel;
     TypeOfLabel.font = [UIFont systemFontOfSize:20];
     TypeOfLabel.textAlignment = NSTextAlignmentCenter;
     //TypeOfLabel.backgroundColor = [UIColor yellowColor];
     return TypeOfLabel;
 }

 - (UITextField* )creatTextField:(NSString* )placeHolder andframe:(CGRect)cgrect andencypt:(BOOL)temp{
     UITextField* textField = [[UITextField alloc] initWithFrame:cgrect];
     textField.placeholder = placeHolder;
     textField.borderStyle = UITextBorderStyleRoundedRect;
     textField.keyboardType = UIKeyboardTypeDefault;
     if (temp) {
         textField.secureTextEntry = YES;
     }
     return textField;
 }


 - (UIButton* )creatButton:(NSString* )value andframe: (CGRect)cgrect andState:(UIControlState)state {
     UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     button.frame = cgrect;
     [button setTitle:value forState:state];
     button.titleLabel.font = [UIFont systemFontOfSize:25];
     return button;
 }

 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     [self.view endEditing:YES];
 }

 - (void) pressLoginButton {
     NSString* name = @"Popxiaoli";
     NSString* password = @"123456789";
     NSString* strTextName = _TextOfUserName.text;
     NSString* strTextPass = _TextOfPassword.text;
     if ([strTextName isEqualToString:name] && [strTextPass isEqualToString:password]) {
         NSLog(@"用户名密码输入正确");
         UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"登陆成功" preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
         [alert addAction: cancleAction];
         [self presentViewController:alert animated:YES completion:nil];
     } else {
         NSLog(@"用户名或密码输入错误");
         UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"登陆失败，用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
         [alert addAction:action];
         [self presentViewController:alert animated:YES completion:nil];
     }
 }
 - (void) pressRegistButton {
     NSLog(@"我是吴彦祖");
 }
 */
