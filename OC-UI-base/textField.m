
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
    
    _textField = [[UITextField alloc] init];
    _textField.frame = CGRectMake(100, 350, 180, 40);
    _textField.font = [UIFont systemFontOfSize:15];
    _textField.textColor = [UIColor blackColor];
    /*
     UITextBorderStyleRoundedRect:圆角风格
     UITextBorderStyleLine:线框风格
     UITextBorderStyleBezel:beze线框
     UITextBorderStyleNone:无边框风格
     */
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    /*
     设置虚拟键盘风格
     UIKeyboardTypeDefault:默认
     UIKeyboardTypeNamePhonePad:字母加数字
     UIKeyBoardTypeNumberPad：纯数字
     */
    _textField.keyboardType = UIKeyboardTypeDefault;
    /*
     提示文字信息
     当text属性为空时，显示此条信息
     浅灰色
     */
    _textField.placeholder = @"请输入用户名";
    /*
     是否作为密码输入
     YES：加密输入
     NO：正常输入
     */
    _textField.secureTextEntry = NO;
    _textField.delegate = self;
    [self.view addSubview:_textField];
   
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"正在进行编辑");
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    _textField.text = @" ";
    NSLog(@"编辑已经结束");
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (_textField.text.length < 8) {
        return NO;
    } else {
        return YES;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不作为消的第一响应着
    [_textField resignFirstResponder];
}
@end
