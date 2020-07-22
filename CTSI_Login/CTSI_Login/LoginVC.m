//
//  LoginVC.m
//  CTSI_Login
//
//  Created by lcl on 2020/6/8.
//  Copyright © 2020 LCL. All rights reserved.
//

#import "LoginVC.h"

#import "LoginTypeADMAndPWDemo.h"
#import "LoginTypeTelAndPINDemo.h"
#import "LoginTypeAllDemo.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    NSArray *btnTitle = @[@"手机号+验证码",@"账号+密码+验证码(可隐藏)",@"两种方式"];
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100 + i%3*(50 + 20), kScreen_Width - 100, 50)];
        [btn setTitle:btnTitle[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 10;
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        btn.layer.borderWidth = 1;
        btn.layer.masksToBounds = YES;
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
}
- (void)clickBtn:(UIButton *)btn{
    if (btn.tag == 0) {
        LoginTypeTelAndPINDemo *loginTypeTelAndPINDemo = [[LoginTypeTelAndPINDemo alloc] init];
       [loginTypeTelAndPINDemo setModalPresentationStyle:UIModalPresentationFullScreen];
        [self presentViewController:loginTypeTelAndPINDemo animated:YES completion:nil];
    }else if (btn.tag == 1){
        LoginTypeADMAndPWDemo *loginTypeADMAndPWDemoVc = [[LoginTypeADMAndPWDemo alloc] init];
              [loginTypeADMAndPWDemoVc setModalPresentationStyle:UIModalPresentationFullScreen];
               [self presentViewController:loginTypeADMAndPWDemoVc animated:YES completion:nil];
    }else if (btn.tag == 2){
        LoginTypeAllDemo *loginTypeAllDemo = [[LoginTypeAllDemo alloc] init];
              [loginTypeAllDemo setModalPresentationStyle:UIModalPresentationFullScreen];
               [self presentViewController:loginTypeAllDemo animated:YES completion:nil];
        
    }
}

@end
