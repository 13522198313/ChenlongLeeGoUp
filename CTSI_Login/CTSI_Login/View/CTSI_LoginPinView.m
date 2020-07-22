//
//  CTSI_LoginPinView.m
//  CTSI_Login
//
//  Created by lcl on 2020/6/11.
//  Copyright © 2020 LCL. All rights reserved.
//
#define GAPH 20
#import "CTSI_LoginPinView.h"
@interface CTSI_LoginPinView()<UITextFieldDelegate>
@property (nonatomic, strong) UIImageView *telImageView;/**手机号图标*/

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIImageView *pinImageView;/**PIN图标*/

@property (nonatomic, strong) UIView *lineTwoView;

@property (nonatomic, strong) UIButton *getPinBtn;/**获取验证码*/



@end

@implementation CTSI_LoginPinView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.lineView];
        [self addSubview:self.telImageView];
        [self addSubview:self.telTextField];
        [self addSubview:self.lineTwoView];
        [self addSubview:self.pinImageView];
        [self addSubview:self.pinTextField];
        [self addSubview:self.getPinBtn];
    }
    return self;
}

- (void)clickGetPinBtn{
    [_delegate CTSI_LoginPinViewDelegateGetPin];
    __block int time = 10;
              __block UIButton *verifybutton = self.getPinBtn;
              verifybutton.titleLabel.textAlignment = NSTextAlignmentCenter;
              
              verifybutton.enabled = NO;
              dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
              dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
              dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
              dispatch_source_set_event_handler(timer, ^{
                  if(time<=0){ //倒计时结束，关闭
                      dispatch_source_cancel(timer);
                      dispatch_async(dispatch_get_main_queue(), ^{
                          
                          verifybutton.backgroundColor = [UIColor clearColor];
                          [verifybutton setTitle:@"获取验证码" forState:UIControlStateNormal];
                          verifybutton.enabled = YES;
                      });
                  }else{
                      dispatch_async(dispatch_get_main_queue(), ^{
                          
                          verifybutton.backgroundColor = [UIColor clearColor];
                          NSString *strTime = [NSString stringWithFormat:@"%ds",time];
                          [verifybutton setTitle:strTime forState:UIControlStateNormal];
                          //verifybutton.titleLabel.textColor = [UIColor blackColor];
                      });
                      time--;
                  }
              });
              dispatch_resume(timer);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
  
    NSString * toBeString = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""]; //得到输入框的内容
    if (textField == self.telTextField) {
           [_delegate CTSI_LoginPinViewDelegateWithTel:toBeString withPin:self.pinTextField.text];
       }else{
           [_delegate CTSI_LoginPinViewDelegateWithTel:self.telTextField.text withPin:toBeString];
       }
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
 
     
    if ([string isEqualToString:@"\n"])  //按会车可以改变
    {
        [textField resignFirstResponder];
        return YES;
    }
       NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
    if (textField == self.telTextField) {
        [_delegate CTSI_LoginPinViewDelegateWithTel:toBeString withPin:self.pinTextField.text];
    }else{
        [_delegate CTSI_LoginPinViewDelegateWithTel:self.telTextField.text withPin:toBeString];
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
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(GAPH, self.frame.size.height/2 - 1, self.frame.size.width - GAPH *2, 1)];
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}

- (UIImageView *)telImageView{
    if (!_telImageView) {
        _telImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.lineView.frame.origin.x, self.lineView.frame.origin.y - 40, 30, 30)];
        _telImageView.image = [UIImage imageNamed:@"CTSI_LoginView_username"];
    }
    return _telImageView;
}

- (UIView *)lineTwoView{
    if (!_lineTwoView) {
        _lineTwoView = [[UIView alloc] initWithFrame:CGRectMake(self.lineView.frame.origin.x, self.frame.size.height - 1, self.lineView.frame.size.width, 1)];
     _lineTwoView.backgroundColor = [UIColor whiteColor];
        }
        return _lineTwoView;
}

- (UIImageView *)pinImageView{
    if (!_pinImageView) {
        _pinImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.telImageView.frame.origin.x, self.lineTwoView.frame.origin.y - 40, self.telImageView.frame.size.width, self.telImageView.frame.size.height)];
        _pinImageView.image = [UIImage imageNamed:@"CTSI_LoginView_password"];
    }
    return _pinImageView;
}

- (UITextField *)telTextField{
    if (!_telTextField) {
        _telTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.telImageView.frame) + GAPH, self.telImageView.frame.origin.y, self.frame.size.width - CGRectGetMaxX(self.telImageView.frame) - GAPH*2, self.telImageView.frame.size.height)];
        _telTextField.placeholder = @"请输入手机号";
        _telTextField.textColor = [UIColor whiteColor];
        _telTextField.textAlignment = NSTextAlignmentLeft;
        [_telTextField setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
          _telTextField.returnKeyType = UIReturnKeyDone;
        _telTextField.delegate = self;
               _telTextField.text = @"";
    }
    return _telTextField;
}

- (UITextField *)pinTextField{
    if (!_pinTextField) {
        _pinTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.pinImageView.frame) + GAPH, self.pinImageView.frame.origin.y, (self.frame.size.width - CGRectGetMaxX(self.pinImageView.frame) - GAPH*2)/2, self.pinImageView.frame.size.height)];
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

- (UIButton *)getPinBtn{
    if (!_getPinBtn) {
        _getPinBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - GAPH - 100, self.pinImageView.frame.origin.y, 100, self.pinImageView.frame.size.height)];
        [_getPinBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_getPinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _getPinBtn.layer.cornerRadius = 15;
        _getPinBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        _getPinBtn.layer.borderWidth = 1;
        [_getPinBtn setBackgroundColor:[UIColor clearColor]];
        _getPinBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_getPinBtn addTarget:self action:@selector(clickGetPinBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getPinBtn;
}
@end
