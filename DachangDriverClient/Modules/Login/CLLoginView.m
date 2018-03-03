//
//  CLLoginView.m
//  51carlife
//
//  Created by lijun mou on 2017/12/19.
//  Copyright © 2017年 aidongsheng. All rights reserved.
//

#import "CLLoginView.h"
#import "CLLoginRequest.h"

@interface CLLoginView()<YTKRequestDelegate>

@property (nonatomic,strong) UIImageView * logoView, * phoneIconView, * vertifyCodeIcon;
@property (nonatomic,strong) QMUITextField * phoneTextField, * vertifyCodeTextField, * passwordField;;
@property (nonatomic,strong) QMUIButton * getVertifyCodeBtn, * loginBtn , *closeBtn;
@end

@implementation CLLoginView

- (instancetype)init
{
    if (self = [super init]) {
        [self setupSubViews];
        [self configureActions];
    }
    return self;
}

- (void)setupSubViews
{
    [super setupSubViews];
    _logoView = [[UIImageView alloc]initWithImage:image(@"carlife_logo")];
    [self addSubview:_logoView];
    _phoneIconView = [[UIImageView alloc]initWithImage:image(@"login_username_icon") renderColor:WhiteColor];
    [self addSubview:_phoneIconView];
    _vertifyCodeIcon = [[UIImageView alloc]initWithImage:image(@"login_password_icon") renderColor:WhiteColor];
    [self addSubview:_vertifyCodeIcon];
    _logoView.contentMode = UIViewContentModeScaleAspectFit;
    _phoneIconView.contentMode = UIViewContentModeScaleAspectFit;
    _phoneIconView.contentMode = UIViewContentModeScaleAspectFit;
    
    _phoneTextField = [[QMUITextField alloc]init];
    _phoneTextField.placeholderColor = GrayColor;
    _phoneTextField.textInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    _phoneTextField.placeholder = @"手机号";
    _phoneTextField.tintColor = naviBar_tint_color;
    _phoneTextField.backgroundColor = WhiteColor;
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_phoneTextField];
    
    _passwordField = [[QMUITextField alloc]init];
    _passwordField.placeholderColor = GrayColor;
    _passwordField.textInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    _passwordField.tintColor = naviBar_tint_color;
    _passwordField.backgroundColor = WhiteColor;
    _passwordField.keyboardType = UIKeyboardTypeASCIICapable;
    _passwordField.secureTextEntry = YES;
    _passwordField.placeholderColor = GrayColor;
    _passwordField.placeholder = @"请输入密码";
    [self addSubview:_passwordField];
    
    _vertifyCodeTextField = [[QMUITextField alloc]init];
    _vertifyCodeTextField.placeholderColor = GrayColor;
    _vertifyCodeTextField.textInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    _vertifyCodeTextField.tintColor = naviBar_tint_color;
    _vertifyCodeTextField.backgroundColor = WhiteColor;
    _vertifyCodeTextField.placeholder = @"输入验证码";
    _vertifyCodeTextField.keyboardType = UIKeyboardTypeASCIICapable;
    [self addSubview:_vertifyCodeTextField];
    
    
    
    _getVertifyCodeBtn = [[QMUIButton alloc]qmui_initWithImage:nil title:@"获取验证码"];
    [_getVertifyCodeBtn setTitleColor:RGB(0, 102, 235, 1) forState:UIControlStateNormal];
    [_getVertifyCodeBtn setBackgroundColor:[UIColor clearColor]];
    [self addSubview:_getVertifyCodeBtn];
    _loginBtn = [[QMUIButton alloc]qmui_initWithImage:nil title:@"登录"];
    [_loginBtn setTitleColor:WhiteColor forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:naviBar_tint_color];
    [self addSubview:_loginBtn];
    _loginBtn.titleLabel.font = [UIFont PingFangSCSemiboldFontSize:LabelFontSizeLarge];
    
    [_logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(@200);
        make.height.equalTo(@100);
        make.top.equalTo(self.mas_top).offset(50);
    }];
    [_phoneIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_logoView.mas_bottom).offset(5*UIElementSpace);
        make.left.equalTo(self.mas_left);
        make.width.height.equalTo(@30);
    }];
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneIconView.mas_right).offset(UIElementSpace);
        make.centerY.equalTo(_phoneIconView.mas_centerY);
        make.height.equalTo(@50);
        make.right.equalTo(self.mas_right).offset(-3*UIElementSpace);
    }];
    [_passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneIconView.mas_right).offset(UIElementSpace);
        make.top.equalTo(_phoneTextField.mas_bottom).offset(UIElementSpace);
        make.height.equalTo(@50);
        make.right.equalTo(self.mas_right).offset(-3*UIElementSpace);
    }];
    [_vertifyCodeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_vertifyCodeTextField.mas_centerY);
        make.left.equalTo(self.mas_left);
        make.width.height.equalTo(@30);
    }];
    [_vertifyCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_vertifyCodeIcon.mas_right).offset(UIElementSpace);
        make.top.equalTo(_passwordField.mas_bottom).offset(UIElementSpace);
        make.height.equalTo(_phoneTextField.mas_height);
        make.right.equalTo(_getVertifyCodeBtn.mas_left).offset(-UIElementSpace);
    }];
    [_getVertifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_vertifyCodeIcon.mas_centerY);
        make.right.equalTo(_phoneTextField.mas_right);
        make.width.equalTo(@100);
        make.height.equalTo(_phoneTextField.mas_height);
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(_phoneTextField.mas_height);
        make.width.equalTo(self.mas_width).multipliedBy(0.7);
        make.top.equalTo(_vertifyCodeTextField.mas_bottom).offset(UIElementSpace*5);
    }];
    
    _closeBtn = [[QMUIButton alloc]qmui_initWithImage:image(@"login_close_icon") title:nil];
    [self addSubview:_closeBtn];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0).offset(UIElementSpace);
        make.width.height.equalTo(@50);
    }];
    [_phoneTextField addCornerRadiusAnimation:5];
    [_vertifyCodeTextField addCornerRadiusAnimation:5];
    [_passwordField addCornerRadiusAnimation:5];
    
    _getVertifyCodeBtn.titleLabel.font = [UIFont PingFangSCMediumFontSize:LabelFontSizeMedium];
    [_phoneIconView addScaleToSmallAnimation:0.5 autoreverses:NO];
    [_vertifyCodeIcon addScaleToSmallAnimation:0.5 autoreverses:NO];
    [_loginBtn addCornerRadiusAnimation:UIElementSpace];
    _phoneTextField.backgroundColor = S_RGB(206);
    _passwordField.backgroundColor = S_RGB(206);
    _vertifyCodeTextField.backgroundColor = S_RGB(206);
    self.backgroundColor = WhiteColor;
}
- (void)configureActions
{
    [super configureActions];
    [_loginBtn blockEvent:^(QMUIButton *button) {
        if (![_phoneTextField isValidPhoneNumber]) {
            [QMUITips showError:@"无效的手机号"
                         inView:[self currentController].view
                 hideAfterDelay:1];
            [_phoneTextField addShakeAnimationOffset:1];
        }else{
            MloginRequest * req = [[MloginRequest alloc]initWithAccount:_phoneTextField.text
                                                               password:_passwordField.text
                                                                   type:1
                                                                   code:@""];
            [req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSDictionary * info = [NSDictionary parseJSONStringToNSDictionary:request.responseString];
                id msg = info[@"msg"];
                if ([msg isKindOfClass:[NSString class]]) {
                    [self showInfo:(NSString *)msg];
                }else if ([msg isKindOfClass:[NSDictionary class]]){
                    NSString * token = [msg objectForKey:@"token"];
                    NSString * phone = [msg objectForKey:@"phone"];
                    NSString * img_url = [msg objectForKey:@"img_url"];
                    [NSUserDefaults setObject:token forKey:@"token"];
                    [NSUserDefaults setObject:phone forKey:@"phone"];
                    [NSUserDefaults setObject:img_url forKey:@"img_url"];
                    [self.viewController dismissViewControllerAnimated:YES completion:nil];
                }
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                
            }];
        }
    }];
    
    [_getVertifyCodeBtn blockEvent:^(QMUIButton *button) {
        [button startCountDown:30];
        GetVertifyRequest * Req = [[GetVertifyRequest alloc]initWithPhone:_phoneTextField.text];
        [Req startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
            NSDictionary * info = [NSDictionary parseJSONStringToNSDictionary:request.responseString];
            id msg = info[@"msg"];
            if ([msg isKindOfClass:[NSString class]]) {
                [self showInfo:(NSString *)msg];
            }else if ([msg isKindOfClass:[NSDictionary class]]){
                
            }
        } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
            
        }];
    }];
    
    [_closeBtn blockEvent:^(QMUIButton *button) {
        [[self currentController] dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
    
}
@end
