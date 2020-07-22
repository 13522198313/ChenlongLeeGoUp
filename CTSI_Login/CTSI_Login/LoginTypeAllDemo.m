//
//  LoginTypeAllDemo.m
//  CTSI_Login
//
//  Created by lcl on 2020/7/21.
//  Copyright © 2020 LCL. All rights reserved.
//

#import "LoginTypeAllDemo.h"
#import "CTSI_LoginView.h"
@interface LoginTypeAllDemo ()<CTSI_LoginViewDelegate>
@property (nonatomic, strong) CTSI_LoginView *loginView;
@end

@implementation LoginTypeAllDemo

- (void)viewDidLoad {
    [super viewDidLoad];
   [self.view addSubview:self.loginView];
}
- (void)CTSI_LoginViewDelegateClickLoginBtnWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - alloc init
- (CTSI_LoginView *)loginView{
    if (!_loginView) {
       
       _loginView = [CTSI_LoginView CTSI_LoginViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) withLoginType:LoginTypeAll IsShowLoginAdmPinView:NO];
        
        _loginView.delegate = self;
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
