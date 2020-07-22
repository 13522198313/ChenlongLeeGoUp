//
//  CTSI_LoginAdmView.h
//  CTSI_Login
//
//  Created by lcl on 2020/6/11.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CTSI_LoginAdmViewDelegate <NSObject>
@optional
- (void)CTSI_LoginAdmViewDelegateWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin;
@required
- (void)CTSI_LoginAdmViewDelegateChangePin;
@end
@interface CTSI_LoginAdmView : UIView
@property (nonatomic,weak) id <CTSI_LoginAdmViewDelegate> delegate;
@property (nonatomic, assign) BOOL isShowLoginAdmPinView;
@property (nonatomic, strong) UITextField *usernameTextField;/**用户名*/
@property (nonatomic, strong) UITextField *psTextField;/**密码*/
@property (nonatomic, strong) UIImage *pinImage;
@end

NS_ASSUME_NONNULL_END
