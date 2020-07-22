//
//  CTSI_LoginView.m
//  CTSI_Login
//
//  Created by lcl on 2020/6/8.
//  Copyright © 2020 LCL. All rights reserved.
//


#define GAPH 20
#import "CTSI_LoginView.h"
#import "CTSI_LoginTypeView.h"
@interface CTSI_LoginView()<CTSI_LoginTypeViewDelegate>
@property (nonatomic, assign) BOOL isShowLoginAdmPinView;

@property (nonatomic, assign) LoginType loginType;
/**背景图*/
@property (nonatomic, strong) UIImageView *bgView;
/**LOGO*/
@property (nonatomic, strong) UIImageView *logoView;
/**显示名称 Lable*/
@property (nonatomic, strong) UILabel *displayNameLab;
/**注册按钮*/
@property (nonatomic, strong) UIButton *registBtn;
/**忘记密码按钮*/
@property (nonatomic, strong) UIButton *forgetPWDBtn;
/**版本号*/
@property (nonatomic, strong) UILabel *versionLab;
/**账号认证,验证码认证*/
@property (nonatomic, strong) UIButton *admBtn, *telBtn;
/**用户名密码和手机号验证码自定义view*/
@property (nonatomic, strong) CTSI_LoginTypeView *loginTypeView;
/**勾选按钮和协议按钮*/
@property (nonatomic, strong) UIButton *checkBtn, *agreementBtn;
/**勾选按钮和记住密码*/
@property (nonatomic, strong) UIButton *checkTwoBtn, *savePWDBtn;
/**登录按钮*/
@property (nonatomic, strong) UIButton *loginBtn;


@end

@implementation CTSI_LoginView
{
    NSString *userName, *passWord, *pinName;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
      
    }
    return self;
}
+ (instancetype)CTSI_LoginViewWithFrame:(CGRect)frame withLoginType:(LoginType)loginType IsShowLoginAdmPinView:(BOOL)isShowLoginAdmPinView{
 
    return [[self alloc] initWithFrame:frame LoginType:loginType IsShowLoginAdmPinView:isShowLoginAdmPinView];
}
- (instancetype)initWithFrame:(CGRect)frame LoginType:(LoginType)loginType IsShowLoginAdmPinView:(BOOL)isShowLoginAdmPinView{
    if (self = [super initWithFrame:frame]) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_SelectSavePW"] == nil) {
                    [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"CTSI_Login_SelectSavePW"];
           
                    [[NSUserDefaults standardUserDefaults] synchronize];
                }
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_Agreement"] == nil) {
                           [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"CTSI_Login_Agreement"];
                  
                           [[NSUserDefaults standardUserDefaults] synchronize];
                       }
        
              [self addSubview:self.bgView];
              [self addSubview:self.logoView];
              [self addSubview:self.displayNameLab];
              [self addSubview:self.telBtn];
              [self addSubview:self.admBtn];
              [self addSubview:self.loginTypeView];
              [self addSubview:self.checkBtn];
              [self addSubview:self.agreementBtn];
              [self addSubview:self.checkTwoBtn];
              [self addSubview:self.savePWDBtn];
              [self addSubview:self.loginBtn];
              [self addSubview:self.registBtn];
              [self addSubview:self.forgetPWDBtn];
              [self addSubview:self.versionLab];
      
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_SelectSavePW"] isEqualToString:@"0"]) {
          
        }else{
            self.checkTwoBtn.selected = YES;
        }
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_Agreement"] isEqualToString:@"0"]) {
                 
               }else{
                   self.checkBtn.selected = YES;
               }
       
        
              self.isShowAgreement =  NO;
              self.isShowSavePW = NO;
              self.isShowRegist = NO;
              self.isShowForgetPW = NO;
        
       
        [self setLoginWithType:loginType IsShowLoginAdmPinView:isShowLoginAdmPinView];
        
    }
    return self;
}

- (void)setLoginWithType:(LoginType)loginType IsShowLoginAdmPinView:(BOOL)isShowLoginAdmPinView{
    _loginType = loginType;
    _isShowLoginAdmPinView = isShowLoginAdmPinView;
     switch (loginType) {
           case LoginTypeADMAndPW:
            
               self.admBtn.hidden = YES;
               self.telBtn.hidden = YES;
             
             if (isShowLoginAdmPinView) {
                 self.loginTypeView.frame = CGRectMake(0, CGRectGetMaxY(self.displayNameLab.frame) + GAPH + GAPH, self.frame.size.width, self.height/4);
             }else{
                 self.loginTypeView.frame = CGRectMake(0, CGRectGetMaxY(self.displayNameLab.frame) + GAPH + GAPH, self.frame.size.width, self.height/6);
             }
             
             
             self.loginTypeView.isShowLoginAdmPinView = isShowLoginAdmPinView;
             
             
             
               self.checkBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginTypeView.frame) + GAPH, 20, 20);
               self.agreementBtn.frame = CGRectMake(CGRectGetMaxX(self.checkBtn.frame), self.checkBtn.frame.origin.y, (self.frame.size.width - GAPH*4)*3/4, self.checkBtn.frame.size.height);
               self.checkTwoBtn.frame = CGRectMake(CGRectGetMaxX(self.agreementBtn.frame), self.agreementBtn.frame.origin.y, 20, 20);
               self.savePWDBtn.frame = CGRectMake(CGRectGetMaxX(self.checkTwoBtn.frame), self.checkTwoBtn.frame.origin.y, (self.frame.size.width - GAPH*5)/4, 20);
               self.loginBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.checkBtn.frame) + GAPH, self.frame.size.width - GAPH *2, GAPH *2);
               self.registBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginBtn.frame) + GAPH, (self.frame.size.width - GAPH *2)/4, GAPH);
               self.forgetPWDBtn.frame = CGRectMake((self.frame.size.width - GAPH *2)*3/4, self.registBtn.frame.origin.y, self.registBtn.frame.size.width, self.registBtn.frame.size.height);
               
               
               [self.loginTypeView.scr setContentOffset:CGPointMake(self.frame.size.width, 0)];
               break;
           case LoginTypeTelAndPIN:
            
               self.admBtn.hidden = YES;
               self.telBtn.hidden = YES;
               self.checkTwoBtn.hidden = YES;
               self.savePWDBtn.hidden = YES;
               self.forgetPWDBtn.hidden = YES;
             
            self.loginTypeView.frame = CGRectMake(0, CGRectGetMaxY(self.displayNameLab.frame) + GAPH + GAPH, self.frame.size.width, self.height/6);
           
             
             self.checkBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginTypeView.frame) + GAPH, 20, 20);
               self.agreementBtn.frame = CGRectMake(CGRectGetMaxX(self.checkBtn.frame), self.checkBtn.frame.origin.y, (self.frame.size.width - GAPH*4)*3/4, self.checkBtn.frame.size.height);
               self.loginBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.checkBtn.frame) + GAPH, self.frame.size.width - GAPH *2, GAPH *2);
               self.registBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginBtn.frame) + GAPH, (self.frame.size.width - GAPH *2)/4, GAPH);
               self.forgetPWDBtn.frame = CGRectMake((self.frame.size.width - GAPH *2)*3/4, self.registBtn.frame.origin.y, self.registBtn.frame.size.width, self.registBtn.frame.size.height);
               
               
               [self.loginTypeView.scr setContentOffset:CGPointMake(0, 0)];
               break;
           case LoginTypeAll:
          
               self.admBtn.hidden = NO;
               self.telBtn.hidden = NO;
             
             
               self.loginTypeView.frame = CGRectMake(0, CGRectGetMaxY(self.displayNameLab.frame) + GAPH + self.admBtn.frame.size.height + GAPH, self.frame.size.width, self.height/6);
             self.loginTypeView.isShowLoginAdmPinView = isShowLoginAdmPinView;
             
             
               self.checkBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginTypeView.frame) + GAPH, 20, 20);
               self.agreementBtn.frame = CGRectMake(CGRectGetMaxX(self.checkBtn.frame), self.checkBtn.frame.origin.y, (self.frame.size.width - GAPH*4)*3/4, self.checkBtn.frame.size.height);
               self.checkTwoBtn.frame = CGRectMake(CGRectGetMaxX(self.agreementBtn.frame), self.agreementBtn.frame.origin.y, 20, 20);
               self.savePWDBtn.frame = CGRectMake(CGRectGetMaxX(self.checkTwoBtn.frame), self.checkTwoBtn.frame.origin.y, (self.frame.size.width - GAPH*5)/4, 20);
               self.loginBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.checkBtn.frame) + GAPH, self.frame.size.width - GAPH *2, GAPH *2);
               self.registBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginBtn.frame) + GAPH, (self.frame.size.width - GAPH *2)/4, GAPH);
               self.forgetPWDBtn.frame = CGRectMake((self.frame.size.width - GAPH *2)*3/4, self.registBtn.frame.origin.y, self.registBtn.frame.size.width, self.registBtn.frame.size.height);
               
               
               
               [self.loginTypeView.scr setContentOffset:CGPointMake(0, 0)];
               break;
       }
}
- (void)setIsShowAgreement:(BOOL)isShowAgreement{
    _isShowAgreement = isShowAgreement;
    if (isShowAgreement) {
        self.checkBtn.hidden = NO;
        self.agreementBtn.hidden = NO;
    }else{
        self.checkBtn.hidden = YES;
        self.agreementBtn.hidden = YES;
    }
}

- (void)setIsShowSavePW:(BOOL)isShowSavePW{
    _isShowSavePW = isShowSavePW;
    switch (self.loginType) {
        case LoginTypeADMAndPW:
            if (isShowSavePW) {
                self.checkTwoBtn.hidden = NO;
                self.savePWDBtn.hidden = NO;
            }else{
                self.checkTwoBtn.hidden = YES;
                self.savePWDBtn.hidden = YES;
            }
            break;
        case LoginTypeTelAndPIN:
            self.checkTwoBtn.hidden = YES;
            self.savePWDBtn.hidden = YES;
            break;
        case LoginTypeAll:
            self.checkTwoBtn.hidden = YES;
            self.savePWDBtn.hidden = YES;
            break;
    }
}

- (void)setIsShowForgetPW:(BOOL)isShowForgetPW{
     _isShowForgetPW = isShowForgetPW;
    switch (self.loginType) {
        case LoginTypeADMAndPW:
            if (isShowForgetPW) {
                self.forgetPWDBtn.hidden = NO;
            }else{
                self.forgetPWDBtn.hidden = YES;
            }
            break;
        case LoginTypeTelAndPIN:
             self.forgetPWDBtn.hidden = YES;
            break;
        case LoginTypeAll:
             self.forgetPWDBtn.hidden = YES;
            break;
    }
}

- (void)setIsShowRegist:(BOOL)isShowRegist{
    _isShowRegist = isShowRegist;
    if (isShowRegist) {
        self.registBtn.hidden = NO;
    }else{
        self.registBtn.hidden = YES;
    }
}

#pragma mark - 勾选协议
- (void)clickcheckBtn{
    self.checkBtn.selected = !self.checkBtn.selected;
    if (self.checkBtn.selected) {
           NSLog(@"选择了同意协议");
           [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"CTSI_Login_Agreement"];
       }else{
           [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"CTSI_Login_Agreement"];
           NSLog(@"没选择了同意协议");
       }
    
    
  
}

- (void)clickCheckTwoBtn{
    self.checkTwoBtn.selected = !self.checkTwoBtn.selected;
    if (self.checkTwoBtn.selected) {
        NSLog(@"选择了记住密码");
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"CTSI_Login_SelectSavePW"];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"CTSI_Login_SelectSavePW"];
        NSLog(@"没选择了记住密码");
    }
}

#pragma mark - 用户协议
- (void)clickAgreementBtn{
    [_delegate CTSI_LoginViewDelegateClickAgreementBtn];
}

#pragma mark - changeLoginTypeMethod
- (void)clickAdmBtn:(UIButton *)sender{//切换登陆方式
    if (sender == self.telBtn) {
        self.telBtn.selected = YES;
        self.admBtn.selected = NO;
        if (self.isShowSavePW) {
                   self.checkTwoBtn.hidden = YES;
                   self.savePWDBtn.hidden = YES;
               }else{
                   self.checkTwoBtn.hidden = YES;
                   self.savePWDBtn.hidden = YES;
               }
               
               if (self.isShowForgetPW) {
                    self.forgetPWDBtn.hidden = YES;
               }else{
                    self.forgetPWDBtn.hidden = YES;
               }
        self.loginTypeView.frame = CGRectMake(0, CGRectGetMaxY(self.displayNameLab.frame) + GAPH + self.admBtn.frame.size.height + GAPH, self.frame.size.width, kScreen_Height/6);
        self.checkBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginTypeView.frame) + GAPH, 20, 20);
        self.agreementBtn.frame = CGRectMake(CGRectGetMaxX(self.checkBtn.frame), self.checkBtn.frame.origin.y, (self.frame.size.width - GAPH*4)*3/4, self.checkBtn.frame.size.height);
        self.checkTwoBtn.frame = CGRectMake(CGRectGetMaxX(self.agreementBtn.frame), self.agreementBtn.frame.origin.y, 20, 20);
        self.savePWDBtn.frame = CGRectMake(CGRectGetMaxX(self.checkTwoBtn.frame), self.checkTwoBtn.frame.origin.y, (self.frame.size.width - GAPH*5)/4, 20);
        self.loginBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.checkBtn.frame) + GAPH, self.frame.size.width - GAPH *2, GAPH *2);
        self.registBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginBtn.frame) + GAPH, (self.frame.size.width - GAPH *2)/4, GAPH);
        self.forgetPWDBtn.frame = CGRectMake((self.frame.size.width - GAPH *2)*3/4, self.registBtn.frame.origin.y, self.registBtn.frame.size.width, self.registBtn.frame.size.height);
        
        [self.loginTypeView.scr setContentOffset:CGPointMake(0, 0)];
    }else{
        self.telBtn.selected = NO;
        self.admBtn.selected = YES;
        
       
        if (self.isShowSavePW) {
            self.checkTwoBtn.hidden = NO;
            self.savePWDBtn.hidden = NO;
        }else{
            self.checkTwoBtn.hidden = YES;
            self.savePWDBtn.hidden = YES;
        }
        
        if (self.isShowForgetPW) {
             self.forgetPWDBtn.hidden = NO;
        }else{
             self.forgetPWDBtn.hidden = YES;
        }
        
        if (self.isShowLoginAdmPinView) {
            self.loginTypeView.frame = CGRectMake(0, CGRectGetMaxY(self.displayNameLab.frame) + GAPH + self.admBtn.frame.size.height + GAPH, self.frame.size.width, kScreen_Height/4);
        }else{
        self.loginTypeView.frame = CGRectMake(0, CGRectGetMaxY(self.displayNameLab.frame) + GAPH + self.admBtn.frame.size.height + GAPH, self.frame.size.width, kScreen_Height/6);
        
        }
        
        
        
        self.checkBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginTypeView.frame) + GAPH, 20, 20);
        self.agreementBtn.frame = CGRectMake(CGRectGetMaxX(self.checkBtn.frame), self.checkBtn.frame.origin.y, (self.frame.size.width - GAPH*4)*3/4, self.checkBtn.frame.size.height);
        self.checkTwoBtn.frame = CGRectMake(CGRectGetMaxX(self.agreementBtn.frame), self.agreementBtn.frame.origin.y, 20, 20);
        self.savePWDBtn.frame = CGRectMake(CGRectGetMaxX(self.checkTwoBtn.frame), self.checkTwoBtn.frame.origin.y, (self.frame.size.width - GAPH*5)/4, 20);
        self.loginBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.checkBtn.frame) + GAPH, self.frame.size.width - GAPH *2, GAPH *2);
        self.registBtn.frame = CGRectMake(GAPH, CGRectGetMaxY(self.loginBtn.frame) + GAPH, (self.frame.size.width - GAPH *2)/4, GAPH);
        self.forgetPWDBtn.frame = CGRectMake((self.frame.size.width - GAPH *2)*3/4, self.registBtn.frame.origin.y, self.registBtn.frame.size.width, self.registBtn.frame.size.height);
        
        
        [self.loginTypeView.scr setContentOffset:CGPointMake(self.frame.size.width, 0)];
    }
}
- (void)setBgImage:(UIImage *)bgImage{
    self.bgView.image = bgImage;
}

- (void)setAppName:(NSString *)appName{
    self.displayNameLab.text = appName;
}

- (void)setLogoImage:(UIImage *)logoImage{
    self.logoView.image = logoImage;
}
- (void)clickForgetPWDBtn{
    [_delegate CTSI_LoginViewDelegateClickForgetPWDBtn];
}
- (void)clickRegistBtn{
    [_delegate CTSI_LoginViewDelegateClickRegistBtn];
}

#pragma mark - CTSI_LoginTypeViewDelegate

- (void)clickLoginBtn{
//    if (self.checkBtn.selected) {
//        NSLog(@"协议勾选");
//    }else{
//        NSLog(@"协议未勾选");
//    }
//
//    if (self.checkTwoBtn.selected) {
//        NSLog(@"记住密码");
//
//
//    }else{
//        NSLog(@"不记住密码");
//
//    }
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_SelectSavePW"] isEqualToString:@"1"]) {
            
       [_delegate CTSI_LoginViewDelegateClickLoginBtnWithUser:userName withPW:[[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_PW"] withPin:pinName];
         
    }else{
       [_delegate CTSI_LoginViewDelegateClickLoginBtnWithUser:userName withPW:passWord withPin:pinName];
               
    }
    
    
}

- (void)CTSI_LoginTypeViewDelegateWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin{
  
    userName = user;
    passWord = pw;
    pinName = pin;
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"CTSI_Login_SelectSavePW"] isEqualToString:@"1"]) {
        [[NSUserDefaults standardUserDefaults] setObject:passWord forKey:@"CTSI_Login_PW"];
         
    }else{
      [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"CTSI_Login_PW"];
    }
}


#pragma mark - alloc init
- (UIImageView *)bgView{
    if (!_bgView) {
        _bgView = [[UIImageView alloc] initWithFrame:self.frame];
        _bgView.image = [UIImage imageNamed:@"CTSI_Login_bg"];
    }
    return _bgView;
}

- (UIImageView *)logoView{
    if (!_logoView) {
        _logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/3, self.frame.size.width/9)];
        _logoView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/8);
        _logoView.image = [UIImage imageNamed:@"CTSI_Login_logo"];
    }
    return _logoView;
}

- (UILabel *)displayNameLab{
    if (!_displayNameLab) {
        _displayNameLab = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/6, CGRectGetMaxY(self.logoView.frame), self.frame.size.width*2/3, self.frame.size.width/4)];
        _displayNameLab.text = @"智慧光网运营平台";
        _displayNameLab.textAlignment = NSTextAlignmentCenter;
        _displayNameLab.numberOfLines = 0;
        _displayNameLab.textColor = [UIColor whiteColor];
        _displayNameLab.font = [UIFont systemFontOfSize:30];
     
    }
    return _displayNameLab;
}

- (UIButton *)telBtn{
    if (!_telBtn) {
        _telBtn = [[UIButton alloc] initWithFrame:CGRectMake(GAPH, CGRectGetMaxY(self.displayNameLab.frame) + GAPH, (self.frame.size.width - GAPH *2)/2, 40)];
        _telBtn.selected = YES;
        _telBtn.adjustsImageWhenHighlighted = NO;
        [_telBtn setBackgroundImage:[UIImage imageNamed:@"CTSI_LoginView_Adm_normal"] forState:UIControlStateNormal];
        [_telBtn setBackgroundImage:[UIImage imageNamed:@"CTSI_LoginView_Adm_select"] forState:UIControlStateSelected];
        [_telBtn setTitle:@"统一认证方式" forState:UIControlStateNormal];
        [_telBtn setTitle:@"统一认证方式" forState:UIControlStateSelected];
        [_telBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [_telBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_telBtn addTarget:self action:@selector(clickAdmBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _telBtn;
}

- (UIButton *)admBtn{
    if (!_admBtn) {
        _admBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.telBtn.frame), self.telBtn.frame.origin.y, (self.frame.size.width - GAPH *2)/2, 40)];
        _admBtn.selected = NO;
        _admBtn.adjustsImageWhenHighlighted = NO;
        [_admBtn setBackgroundImage:[UIImage imageNamed:@"CTSI_LoginView_Pin_normal"] forState:UIControlStateNormal];
        [_admBtn setBackgroundImage:[UIImage imageNamed:@"CTSI_LoginView_Pin_select"] forState:UIControlStateSelected];
        [_admBtn setTitle:@"账号登录" forState:UIControlStateNormal];
        [_admBtn setTitle:@"账号登录" forState:UIControlStateSelected];
        [_admBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [_admBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_admBtn addTarget:self action:@selector(clickAdmBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _admBtn;
}

- (CTSI_LoginTypeView *)loginTypeView{
    if (!_loginTypeView) {
        _loginTypeView = [[CTSI_LoginTypeView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.displayNameLab.frame) + GAPH + self.admBtn.frame.size.height + GAPH, self.frame.size.width, self.height/4)];
        _loginTypeView.delegate = self;
    }
    return _loginTypeView;
}

- (UIButton *)checkBtn{
    if (!_checkBtn) {
        _checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(GAPH, CGRectGetMaxY(self.loginTypeView.frame) + GAPH, 20, 20)];
        [_checkBtn setBackgroundImage:[UIImage imageNamed:@"CTSI_LoginView_checked"] forState:UIControlStateSelected];
        [_checkBtn setBackgroundImage:[UIImage imageNamed:@"CTSI_LoginView_nochecked"] forState:UIControlStateNormal];
        [_checkBtn addTarget:self action:@selector(clickcheckBtn) forControlEvents:UIControlEventTouchUpInside];
        _checkBtn.adjustsImageWhenHighlighted = NO;
    }
    return _checkBtn;
}

- (UIButton *)agreementBtn{
    if (!_agreementBtn) {
        _agreementBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.checkBtn.frame), self.checkBtn.frame.origin.y, (self.frame.size.width - GAPH*4)*3/4, self.checkBtn.frame.size.height)];
        NSString * aStr = @"同意并阅读";
        NSString * bStr = @"⟪用户隐私政策协议⟫";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",aStr,bStr]];
        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:15.0] range:NSMakeRange(0,aStr.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,aStr.length)];
        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldItalicMT" size:15.0] range:NSMakeRange(aStr.length,bStr.length)];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(aStr.length,bStr.length)];
        [_agreementBtn setAttributedTitle:str forState:UIControlStateNormal];
        [_agreementBtn addTarget:self action:@selector(clickAgreementBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreementBtn;
}

- (UIButton *)checkTwoBtn{
    if (!_checkTwoBtn) {
        _checkTwoBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.agreementBtn.frame), self.agreementBtn.frame.origin.y, 20, 20)];
       
            [_checkTwoBtn setBackgroundImage:[UIImage imageNamed:@"CTSI_LoginView_checked"] forState:UIControlStateSelected];
            [_checkTwoBtn setBackgroundImage:[UIImage imageNamed:@"CTSI_LoginView_nochecked"] forState:UIControlStateNormal];
       
        
        [_checkTwoBtn addTarget:self action:@selector(clickCheckTwoBtn) forControlEvents:UIControlEventTouchUpInside];
        _checkTwoBtn.adjustsImageWhenHighlighted = NO;
        
    }
    return _checkTwoBtn;
}

- (UIButton *)savePWDBtn{
    if (!_savePWDBtn) {
        _savePWDBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.checkTwoBtn.frame), self.checkTwoBtn.frame.origin.y, (self.frame.size.width - GAPH*5)/4, 20)];
        [_savePWDBtn setTitle:@"记住密码" forState:UIControlStateNormal];
        [_savePWDBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _savePWDBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _savePWDBtn;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(GAPH, CGRectGetMaxY(self.checkBtn.frame) + GAPH, self.frame.size.width - GAPH *2, GAPH *2)];
        [_loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor colorWithRed:0.07 green:0.72 blue:0.96 alpha:1] forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor whiteColor]];
        _loginBtn.layer.cornerRadius = 20;
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_loginBtn addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)registBtn{
    if (!_registBtn) {
        _registBtn = [[UIButton alloc] initWithFrame:CGRectMake(GAPH, CGRectGetMaxY(self.loginBtn.frame) + GAPH, (self.frame.size.width - GAPH *2)/4, GAPH)];
        [_registBtn setBackgroundColor:[UIColor clearColor]];
        [_registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registBtn setTitle:@"注册账号" forState:UIControlStateNormal];
        [_registBtn addTarget:self action:@selector(clickRegistBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registBtn;
}

- (UIButton *)forgetPWDBtn{
    if (!_forgetPWDBtn) {
        _forgetPWDBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width - GAPH *2)*3/4, self.registBtn.frame.origin.y, self.registBtn.frame.size.width, self.registBtn.frame.size.height)];
        [_forgetPWDBtn setBackgroundColor:[UIColor clearColor]];
        [_forgetPWDBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_forgetPWDBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_forgetPWDBtn addTarget:self action:@selector(clickForgetPWDBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPWDBtn;
}

- (UILabel *)versionLab{
    if (!_versionLab) {
        _versionLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - GAPH *3, self.frame.size.width, GAPH)];
        _versionLab.textColor = [UIColor whiteColor];
        _versionLab.textAlignment = NSTextAlignmentCenter;
        _versionLab.text = [NSString stringWithFormat:@"版本号:%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    }
    return _versionLab;
}
@end
