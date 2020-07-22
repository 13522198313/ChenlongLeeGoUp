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
    NSLog(@"changePIN");
    
    
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
    //换textField
    
    //NSString * toBeString = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""]; //得到输入框的内容
    [_delegate CTSI_LoginAdmViewDelegateWithUser:self.usernameTextField.text withPW:self.psTextField.text withPin:self.pinTextField.text];
    
//    if ([toBeString isEqualToString:@""]) {
//        if (textField == self.usernameTextField) {
//            [_delegate showTip:@"用户名不能为空"];
//        }else if (textField == self.psTextField){
//            [_delegate showTip:@"密码不能为空"];
//        }else if (textField == self.pinTextField){
//            [_delegate showTip:@"验证码不能为空"];
//        }
//    }else{
//        [_delegate CTSI_LoginAdmViewDelegateWithUser:self.usernameTextField.text withPW:self.psTextField.text withPin:self.pinTextField.text];
//    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"])  //按会车可以改变
    {
        [textField resignFirstResponder];
        return YES;
    }
   // NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
//    if ([toBeString isEqualToString:@""]) {
//        if (textField == self.usernameTextField) {
//            [_delegate showTip:@"用户名不能为空"];
//        }else if (textField == self.psTextField){
//            [_delegate showTip:@"密码不能为空"];
//        }else if (textField == self.pinTextField){
//            [_delegate showTip:@"验证码不能为空"];
//        }
//    }else{
        [_delegate CTSI_LoginAdmViewDelegateWithUser:self.usernameTextField.text withPW:self.psTextField.text withPin:self.pinTextField.text];
        
        
    //}
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
        _psTextField.text = @"";
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
        
        //Base64字符串转UIImage图片：
        NSData *decodedImageData = [[NSData alloc]
                                    initWithBase64EncodedString:@"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" options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
        _pinImageView.image = decodedImage;
    }
    return _pinImageView;
}
@end
