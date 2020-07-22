//
//  CTSI_LoginPinView.h
//  CTSI_Login
//
//  Created by lcl on 2020/6/11.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CTSI_LoginPinViewDelegate <NSObject>

- (void)CTSI_LoginPinViewDelegateGetPin;
- (void)CTSI_LoginPinViewDelegateWithTel:(NSString *)tel withPin:(NSString *)pin;

@end
@interface CTSI_LoginPinView : UIView
@property (nonatomic, strong) UITextField *telTextField;/**手机号*/
@property (nonatomic, strong) UITextField *pinTextField;/**验证码*/
@property (nonatomic,weak) id <CTSI_LoginPinViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
