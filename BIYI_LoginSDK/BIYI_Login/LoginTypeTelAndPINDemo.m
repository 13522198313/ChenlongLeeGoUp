//
//  LoginTypeTelAndPINDemo.m
//  BIYI_Login
//
//  Created by lcl on 2020/7/21.
//  Copyright © 2020 LCL. All rights reserved.
//

#import "LoginTypeTelAndPINDemo.h"
#import "BIYI_LoginView.h"
@interface LoginTypeTelAndPINDemo ()<BIYI_LoginViewDelegate>
@property (nonatomic, strong) BIYI_LoginView *loginView;
@end

@implementation LoginTypeTelAndPINDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self.view addSubview:self.loginView];
}



/**获取验证码*/
- (void)BIYI_LoginViewDelegateGetPinBtn{
    NSLog(@"BIYI_LoginPinViewDelegateGetPin");
}
/**查看协议*/
- (void)BIYI_LoginViewDelegateClickAgreementBtn{
    NSLog(@"BIYI_LoginViewDelegateClickAgreementBtn");
}
/**注册*/
- (void)BIYI_LoginViewDelegateClickRegistBtn{
    NSLog(@"BIYI_LoginViewDelegateClickRegistBtn");
}
/**忘记密码*/
- (void)BIYI_LoginViewDelegateClickForgetPWDBtn{
    NSLog(@"BIYI_LoginViewDelegateClickForgetPWDBtn");
}
/**登陆*/
- (void)BIYI_LoginViewDelegateClickLoginBtnWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin{
    NSLog(@"tel===user==%@",user);
    NSLog(@"tel===pw==%@",pw);
    NSLog(@"tel===pin==%@",pin);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - alloc init
- (BIYI_LoginView *)loginView{
    if (!_loginView) {
        
        _loginView = [BIYI_LoginView BIYI_LoginViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) withLoginType:LoginTypeTelAndPIN IsShowLoginAdmPinView:NO];
        _loginView.delegate = self;
        _loginView.length = 29;
        //LoginTypeADMAndPW
        //LoginTypeTelAndPIN
        //LoginTypeAll
        
        _loginView.isShowAgreement = YES;
        _loginView.isShowSavePW = YES;
        _loginView.isShowRegist = YES;
        _loginView.isShowForgetPW = YES;
        
        
    }
    return _loginView;
}



@end
