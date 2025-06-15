#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic, retain)UILabel* Username;
@property(nonatomic, retain)UILabel* Password;
@property(nonatomic, retain)UITextField* TextOfUserName;
@property(nonatomic, retain)UITextField* TextOfPassword;
@property(nonatomic, retain)UIButton* LoginOfButton;
@property(nonatomic, retain)UIButton* RegistOfButton;
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
@end
