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

- (void)showTip:(NSString *)tip;
- (void)CTSI_LoginTypeViewDelegateWithUser:(NSString *)user withPW:(NSString *)pw withPin:(NSString *)pin;


@end

@interface CTSI_LoginTypeView : UIView
@property (nonatomic,weak) id <CTSI_LoginTypeViewDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scr;
@property (nonatomic, assign) BOOL isShowLoginAdmPinView;
@end

NS_ASSUME_NONNULL_END
