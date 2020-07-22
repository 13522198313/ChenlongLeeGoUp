//
//  CTSI_LoginView.h
//  CTSI_Login
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

@protocol CTSI_LoginViewDelegate <NSObject>

@required
- (void)CTSI_LoginViewDelegateClickLoginBtnWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin;
@optional
- (void)CTSI_LoginViewDelegateClickRegistBtn;
- (void)CTSI_LoginViewDelegateClickForgetPWDBtn;
- (void)CTSI_LoginViewDelegateClickAgreementBtn;


@end
@interface CTSI_LoginView : UIView
@property (nonatomic,weak) id <CTSI_LoginViewDelegate> delegate;
/**显示协议*/
@property (nonatomic, assign) BOOL isShowAgreement;
/**显示记住密码*/
@property (nonatomic, assign) BOOL isShowSavePW;
/**显示注册账号*/
@property (nonatomic, assign) BOOL isShowRegist;
/**显示忘记密码*/
@property (nonatomic, assign) BOOL isShowForgetPW;

/**登陆类型*/
+ (instancetype)CTSI_LoginViewWithFrame:(CGRect)frame withLoginType:(LoginType)loginType IsShowLoginAdmPinView:(BOOL)isShowLoginAdmPinView;

/**背景图片*/
@property (nonatomic, strong) UIImage *bgImage;
/**appName*/
@property (nonatomic, copy) NSString *appName;
/**企业logo*/
@property (nonatomic, strong) UIImage *logoImage;

@end


NS_ASSUME_NONNULL_END
