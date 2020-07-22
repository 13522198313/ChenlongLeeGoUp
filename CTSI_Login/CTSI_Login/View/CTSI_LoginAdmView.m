//
//  CTSI_LoginAdmView.m
//  CTSI_Login
//
//  Created by lcl on 2020/6/11.
//  Copyright © 2020 LCL. All rights reserved.
//
#define GAPH 20
#import "CTSI_LoginAdmView.h"
@interface CTSI_LoginAdmView()<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView *userImageView;/**用户名图标*/

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIImageView *pwImageView;/**密码图标*/

@property (nonatomic, strong) UIView *lineTwoView;



@property (nonatomic, strong) UIButton *showPw;/**显示密码*/

@property (nonatomic, strong) UIView *lineThreeView;

@property (nonatomic, strong) UITextField *pinTextField;/**PIN*/

@property (nonatomic, strong) UIImageView *pinImageView;/**PIN图标*/

@end
@implementation CTSI_LoginAdmView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.lineView];
        [self addSubview:self.userImageView];
        [self addSubview:self.usernameTextField];
        [self addSubview:self.lineTwoView];
        [self addSubview:self.pwImageView];
        [self addSubview:self.psTextField];
        [self addSubview:self.showPw];
        [self addSubview:self.lineThreeView];
        [self addSubview:self.pinTextField];
        [self addSubview:self.pinImageView];
        
    }
    return self;
}

- (void)setIsShowLoginAdmPinView:(BOOL)isShowLoginAdmPinView{
    if (isShowLoginAdmPinView) {
        self.lineThreeView.hidden = NO;
        self.pinTextField.hidden = NO;
        self.pinImageView.hidden = NO;
    }else{
        self.lineThreeView.hidden = YES;
        self.pinTextField.hidden = YES;
        self.pinImageView.hidden = YES;
    }
}

- (void)changePIN{
    [_delegate CTSI_LoginAdmViewDelegateChangePin];
    
}
- (void)setPinImage:(UIImage *)pinImage{
   //_pinImage = pinImage;
    _pinImageView.image = pinImage;
}
- (void)clickShowPwBtn:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.psTextField.secureTextEntry = NO;
        [_showPw setBackgroundImage:[UIImage imageNamed:@"eye"] forState:UIControlStateNormal];
        
    }else{
        self.psTextField.secureTextEntry = YES;
        [_showPw setBackgroundImage:[UIImage imageNamed:@"visible"] forState:UIControlStateNormal];
        
    }
}
#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
  NSString * toBeString = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""]; //得到输入框的内容
  if (textField == self.usernameTextField) {
         [_delegate CTSI_LoginAdmViewDelegateWithUser:toBeString withPW:self.psTextField.text withPin:self.pinTextField.text];
  }else if (textField == self.psTextField){
          [_delegate CTSI_LoginAdmViewDelegateWithUser:self.usernameTextField.text withPW:toBeString withPin:self.pinTextField.text];
  }else{
       [_delegate CTSI_LoginAdmViewDelegateWithUser:self.usernameTextField.text withPW:self.psTextField.text withPin:toBeString];
  }
   

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"])  //按会车可以改变
    {
        [textField resignFirstResponder];
        return YES;
    }
           NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
        if (textField == self.usernameTextField) {
               [_delegate CTSI_LoginAdmViewDelegateWithUser:toBeString withPW:self.psTextField.text withPin:self.pinTextField.text];
        }else if (textField == self.psTextField){
                [_delegate CTSI_LoginAdmViewDelegateWithUser:self.usernameTextField.text withPW:toBeString withPin:self.pinTextField.text];
        }else{
             [_delegate CTSI_LoginAdmViewDelegateWithUser:self.usernameTextField.text withPW:self.psTextField.text withPin:toBeString];
        }
         
        
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - alloc init
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(GAPH, self.frame.size.height/3 - 1, self.frame.size.width - GAPH *2, 1)];
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}

- (UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.lineView.frame.origin.x, self.lineView.frame.origin.y - 40, 30, 30)];
        _userImageView.image = [UIImage imageNamed:@"CTSI_LoginView_username"];
    }
    return _userImageView;
}

- (UITextField *)usernameTextField{
    if (!_usernameTextField) {
        _usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.userImageView.frame) + GAPH, self.userImageView.frame.origin.y, self.frame.size.width - CGRectGetMaxX(self.userImageView.frame) - GAPH*2, self.userImageView.frame.size.height)];
        _usernameTextField.placeholder = @"请输入用户名";
        _usernameTextField.textColor = [UIColor whiteColor];
        _usernameTextField.textAlignment = NSTextAlignmentLeft;
        [_usernameTextField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
        _usernameTextField.returnKeyType = UIReturnKeyDone;
        _usernameTextField.delegate = self;
         _usernameTextField.text = @"";
    }
    return _usernameTextField;
}

- (UIView *)lineTwoView{
    if (!_lineTwoView) {
        _lineTwoView = [[UIView alloc] initWithFrame:CGRectMake(self.lineView.frame.origin.x, self.frame.size.height*2/3 - 1, self.lineView.frame.size.width, 1)];
        _lineTwoView.backgroundColor = [UIColor whiteColor];
    }
    return _lineTwoView;
}

- (UIImageView *)pwImageView{
    if (!_pwImageView) {
        _pwImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.userImageView.frame.origin.x, self.lineTwoView.frame.origin.y - 40, self.userImageView.frame.size.width, self.userImageView.frame.size.height)];
        _pwImageView.image = [UIImage imageNamed:@"CTSI_LoginView_password"];
    }
    return _pwImageView;
}

- (UITextField *)psTextField{
    if (!_psTextField) {
        _psTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.pwImageView.frame) + GAPH, self.pwImageView.frame.origin.y, self.frame.size.width - CGRectGetMaxX(self.pwImageView.frame) *2 - GAPH, self.pwImageView.frame.size.height)];
        _psTextField.placeholder = @"请输入密码";
        _psTextField.textColor = [UIColor whiteColor];
        _psTextField.textAlignment = NSTextAlignmentLeft;
        [_psTextField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
        _psTextField.secureTextEntry = YES;
        _psTextField.returnKeyType = UIReturnKeyDone;
        _psTextField.delegate = self;
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_SelectSavePW"] isEqualToString:@"1"]) {
                   
               _psTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_PW"];
                
           }else{
               [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"CTSI_Login_PW"];
               _psTextField.text = @"";
           }
        
    }
    return _psTextField;
}

- (UIButton *)showPw{
    if (!_showPw) {
        _showPw = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.psTextField.frame), self.psTextField.frame.origin.y, 30, 30)];
        [_showPw setBackgroundImage:[UIImage imageNamed:@"visible"] forState:UIControlStateNormal];
        [_showPw addTarget:self action:@selector(clickShowPwBtn:) forControlEvents:UIControlEventTouchUpInside];
        _showPw.adjustsImageWhenHighlighted = NO;
    }
    return _showPw;
}

- (UIView *)lineThreeView{
    if (!_lineThreeView) {
        _lineThreeView = [[UIView alloc] initWithFrame:CGRectMake(self.lineTwoView.frame.origin.x, self.frame.size.height - 1, self.lineTwoView.frame.size.width*3/4, 1)];
        _lineThreeView.backgroundColor = [UIColor whiteColor];
    }
    return _lineThreeView;
}

- (UITextField *)pinTextField{
    if (!_pinTextField) {
        _pinTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.lineThreeView.frame.origin.x, self.lineThreeView.frame.origin.y - 40, self.lineThreeView.frame.size.width, self.pwImageView.frame.size.height)];
        _pinTextField.placeholder = @"请输入验证码";
        _pinTextField.textColor = [UIColor whiteColor];
        _pinTextField.textAlignment = NSTextAlignmentLeft;
        [_pinTextField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
        _pinTextField.returnKeyType = UIReturnKeyDone;
        _pinTextField.delegate = self;
        _pinTextField.text = @"";
    }
    return _pinTextField;
}

- (UIImageView *)pinImageView{
    if (!_pinImageView) {
        _pinImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.pinTextField.frame), self.pinTextField.y, self.lineTwoView.frame.size.width/4, self.pinTextField.height)];
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changePIN)];
        
        tap.numberOfTapsRequired = 1;
        _pinImageView.userInteractionEnabled = YES;
        [_pinImageView addGestureRecognizer:tap];
        
        
        _pinImageView.image = [UIImage imageNamed:@"CTSI_LoginView_AdmPin_placeholderImage"];
    }
    return _pinImageView;
}
@end

