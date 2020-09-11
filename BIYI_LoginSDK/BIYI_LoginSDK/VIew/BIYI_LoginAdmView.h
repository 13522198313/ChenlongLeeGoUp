//
//  BIYI_LoginAdmView.h
//  BIYI_Login
//
//  Created by lcl on 2020/6/11.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BIYI_LoginAdmViewDelegate <NSObject>
@optional
- (void)BIYI_LoginAdmViewDelegateWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin;
@required
- (void)BIYI_LoginAdmViewDelegateChangePin;
@end
@interface BIYI_LoginAdmView : UIView
@property (nonatomic,weak) id <BIYI_LoginAdmViewDelegate> delegate;
@property (nonatomic, assign) BOOL isShowLoginAdmPinView;
@property (nonatomic, strong) UITextField *usernameTextField;/**用户名*/
@property (nonatomic, strong) UITextField *psTextField;/**密码*/
@property (nonatomic, strong) UIImage *pinImage;
@end

NS_ASSUME_NONNULL_END
