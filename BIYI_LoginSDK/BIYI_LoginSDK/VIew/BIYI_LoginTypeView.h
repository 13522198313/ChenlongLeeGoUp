//
//  BIYI_LoginTypeView.h
//  BIYI_Login
//
//  Created by lcl on 2020/6/9.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BIYI_LoginTypeViewDelegate <NSObject>

- (void)BIYI_LoginTypeViewDelegateWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin;
- (void)BIYI_LoginTypeViewDelegateGetPinBtn;
- (void)BIYI_LoginTypeViewDelegateChangePin;

@end

@interface BIYI_LoginTypeView : UIView
@property (nonatomic,weak) id <BIYI_LoginTypeViewDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scr;
@property (nonatomic, assign) BOOL isShowLoginAdmPinView;
/**获取验证码时长*/
@property (nonatomic, assign) int length;
@property (nonatomic, strong) UIImage *pinImage;
@end

NS_ASSUME_NONNULL_END
