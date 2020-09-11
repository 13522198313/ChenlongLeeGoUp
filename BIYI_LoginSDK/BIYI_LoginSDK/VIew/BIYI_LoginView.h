//
//  BIYI_LoginView.h
//  BIYI_Login
//
//  Created by lcl on 2020/6/8.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,LoginType){
        LoginTypeADMAndPW = 0,
        LoginTypeTelAndPIN = 1,
        LoginTypeAll = 2
};

@protocol BIYI_LoginViewDelegate <NSObject>

@required
/**登陆*/
- (void)BIYI_LoginViewDelegateClickLoginBtnWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin;
@optional
/**注册*/
- (void)BIYI_LoginViewDelegateClickRegistBtn;
/**忘记密码*/
- (void)BIYI_LoginViewDelegateClickForgetPWDBtn;
/**查看协议*/
- (void)BIYI_LoginViewDelegateClickAgreementBtn;
/**获取验证码*/
- (void)BIYI_LoginViewDelegateGetPinBtn;
/**改变验证码*/
- (void)BIYI_LoginViewDelegateChangePin;
@end
@interface BIYI_LoginView : UIView
@property (nonatomic,weak) id <BIYI_LoginViewDelegate> delegate;
/**显示协议*/
@property (nonatomic, assign) BOOL isShowAgreement;
/**显示记住密码*/
@property (nonatomic, assign) BOOL isShowSavePW;
/**显示注册账号*/
@property (nonatomic, assign) BOOL isShowRegist;
/**显示忘记密码*/
@property (nonatomic, assign) BOOL isShowForgetPW;

/**登陆类型*/
+ (instancetype)BIYI_LoginViewWithFrame:(CGRect)frame withLoginType:(LoginType)loginType IsShowLoginAdmPinView:(BOOL)isShowLoginAdmPinView;

/**背景图片*/
@property (nonatomic, strong) UIImage *bgImage;
/**appName*/
@property (nonatomic, copy) NSString *appName;
/**企业logo*/
@property (nonatomic, strong) UIImage *logoImage;
/**获取验证码时长*/
@property (nonatomic, assign) int length;
/**验证码图片*/
@property (nonatomic, strong) UIImage *pinImage;
@end


NS_ASSUME_NONNULL_END
