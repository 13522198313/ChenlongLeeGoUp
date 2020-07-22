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
/**改变验证码*/
- (void)CTSI_LoginViewDelegateChangePin{
     NSLog(@"请求数据===验证码图片数据");
       //Base64字符串转UIImage图片：
       NSData *decodedImageData = [[NSData alloc]
                                   initWithBase64EncodedString:@"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" options:NSDataBase64DecodingIgnoreUnknownCharacters];
       UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
       //self.loginView.pinImage = decodedImage;
}
/**获取验证码*/
- (void)CTSI_LoginViewDelegateGetPinBtn{
    NSLog(@"CTSI_LoginPinViewDelegateGetPin");
}
/**查看协议*/
- (void)CTSI_LoginViewDelegateClickAgreementBtn{
    NSLog(@"CTSI_LoginViewDelegateClickAgreementBtn");
}
/**注册*/
- (void)CTSI_LoginViewDelegateClickRegistBtn{
    NSLog(@"CTSI_LoginViewDelegateClickRegistBtn");
}
/**忘记密码*/
- (void)CTSI_LoginViewDelegateClickForgetPWDBtn{
    NSLog(@"CTSI_LoginViewDelegateClickForgetPWDBtn");
}
/**登陆*/
- (void)CTSI_LoginViewDelegateClickLoginBtnWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin{
    NSLog(@"tel===user==%@",user);
    NSLog(@"tel===pw==%@",pw);
    NSLog(@"tel===pin==%@",pin);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - alloc init
- (CTSI_LoginView *)loginView{
    if (!_loginView) {
       
       _loginView = [CTSI_LoginView CTSI_LoginViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) withLoginType:LoginTypeAll IsShowLoginAdmPinView:NO];
        
        _loginView.delegate = self;
        _loginView.length = 10;
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
