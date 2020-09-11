//
//  BIYI_LoginPinView.h
//  BIYI_Login
//
//  Created by lcl on 2020/6/11.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BIYI_LoginPinViewDelegate <NSObject>

- (void)BIYI_LoginPinViewDelegateGetPin;
- (void)BIYI_LoginPinViewDelegateWithTel:(NSString *)tel withPin:(NSString *)pin;

@end
@interface BIYI_LoginPinView : UIView
@property (nonatomic, strong) UITextField *telTextField;/**手机号*/
@property (nonatomic, strong) UITextField *pinTextField;/**验证码*/
@property (nonatomic,weak) id <BIYI_LoginPinViewDelegate> delegate;
@property (nonatomic, assign) int length;
@end

NS_ASSUME_NONNULL_END
