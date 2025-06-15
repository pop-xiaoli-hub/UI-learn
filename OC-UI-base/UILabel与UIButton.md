# UILabel与UIButton

# UILabel

1. UILabel是UIKit框架中的一个类，可以显示在屏幕上

```c
- (void) createUI {
    //UILable是显示在屏幕上的，并且可以显示文字的一种UI视图
    UILabel* label = [[UILabel alloc] init];
    //显示文字赋值,字符串对象
    label.text = @"请选择登录界面";
    //设定lable的显示位置
    label.frame = CGRectMake(130, 200, 160, 40);
    //设置UI背景色/clearColor表示透明色
    label.backgroundColor = [UIColor yellowColor];
    //将lable显示到屏幕上
    [self.view addSubview:label];
    //调整lable文字大小，使用系统默认字体，大小为20
    label.font = [UIFont systemFontOfSize:22];
    label.textColor = [UIColor blackColor];
    //lable的高级属性
    //设定阴影的颜色
    label.shadowColor = [UIColor grayColor];
    //设定阴影的偏移量
    label.shadowOffset = CGSizeMake(3, 3);
    //设置text文字的对齐模式，默认为靠左侧对齐，center为居中对齐。right右对齐
    label.textAlignment = NSTextAlignmentCenter;
    //如果文本过长，会出现省略号,一下实现自动换行,其他的大于0的情况，文字会尽量按照设定行数显示，如果为0，那么会对文字自动计算所需要的行数
    label.numberOfLines = 0;
    
}
```

![simulator_screenshot_B88503C8-E76E-479C-9987-4F30EF7AED29](/Users/xiaolipop/Library/Application Support/typora-user-images/simulator_screenshot_B88503C8-E76E-479C-9987-4F30EF7AED29.png)



## UIBUtton

* 创建普通按钮

```c
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
```

* 创建图片按钮

```c
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
```

* 事件处理

```c
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
```

![simulator_screenshot_0F9A7EBB-9D12-462C-BAD4-E422F82E09CC](/Users/xiaolipop/Library/Application Support/typora-user-images/simulator_screenshot_0F9A7EBB-9D12-462C-BAD4-E422F82E09CC.png)

1. 按压并松开最上面按钮出现如下输出

> 按钮被触碰
>
> button01 is pressed



2. 触碰修改密码密码按钮会出现

> 请输入新密码
>
> button02 is pressed



> 根据按钮不同的状态（UIControlEvents）显示不同的样式