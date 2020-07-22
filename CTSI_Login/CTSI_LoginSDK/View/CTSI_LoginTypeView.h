//
//  CTSI_LoginTypeView.h
//  CTSI_Login
//
//  Created by lcl on 2020/6/9.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CTSI_LoginTypeViewDelegate <NSObject>

- (void)CTSI_LoginTypeViewDelegateWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin;
- (void)CTSI_LoginTypeViewDelegateGetPinBtn;
- (void)CTSI_LoginTypeViewDelegateChangePin;

@end

@interface CTSI_LoginTypeView : UIView
@property (nonatomic,weak) id <CTSI_LoginTypeViewDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scr;
@property (nonatomic, assign) BOOL isShowLoginAdmPinView;
/**获取验证码时长*/
@property (nonatomic, assign) int length;
@property (nonatomic, strong) UIImage *pinImage;
@end

NS_ASSUME_NONNULL_END
