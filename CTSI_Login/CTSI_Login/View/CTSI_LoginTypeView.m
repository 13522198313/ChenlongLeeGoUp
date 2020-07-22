//
//  CTSI_LoginTypeView.m
//  CTSI_Login
//
//  Created by lcl on 2020/6/9.
//  Copyright © 2020 LCL. All rights reserved.
//

#import "CTSI_LoginTypeView.h"
#import "CTSI_LoginPinView.h"
#import "CTSI_LoginAdmView.h"
@interface CTSI_LoginTypeView()<UIScrollViewDelegate,CTSI_LoginPinViewDelegate,CTSI_LoginAdmViewDelegate>
@property (nonatomic, strong) CTSI_LoginPinView *loginPinView;
@property (nonatomic, strong) CTSI_LoginAdmView *loginAdmView;
@property (nonatomic, copy) NSString *type;
@end

@implementation CTSI_LoginTypeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.loginPinView.delegate = self;
        [self.scr addSubview:self.loginPinView];
        [self.scr addSubview:self.loginAdmView];
        [self.scr setContentSize:CGSizeMake(self.frame.size.width*2, self.frame.size.height)];
        
        [self addSubview:self.scr];
    }
    return self;
}
 
#pragma \mark - CTSI_LoginAdmViewDelegate
- (void)showTip:(NSString *)tip{
   
    [_delegate showTip:tip];
}

- (void)CTSI_LoginAdmViewDelegateWithUser:(nonnull NSString *)user withPW:(nonnull NSString *)pw withPin:(nonnull NSString *)pin {
    
    [_delegate CTSI_LoginTypeViewDelegateWithUser:user withPW:pw withPin:pin];
}

#pragma mark - CTSI_LoginPinViewDelegate
- (void)CTSI_LoginPinViewDelegateGetPin{
    
    NSLog(@"CTSI_LoginPinViewDelegateGetPin");
    
}
- (void)setIsShowLoginAdmPinView:(BOOL)isShowLoginAdmPinView{
    
    self.loginAdmView.isShowLoginAdmPinView = isShowLoginAdmPinView;
    
}
#pragma mark - alloc init
- (UIScrollView *)scr{
    if (!_scr) {
        _scr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scr.pagingEnabled = YES;
        _scr.showsHorizontalScrollIndicator = NO;
        _scr.showsVerticalScrollIndicator = NO;
        _scr.scrollEnabled = NO;
        _scr.delegate = self;
        _scr.backgroundColor = [UIColor clearColor];
    }
    return _scr;
}
- (CTSI_LoginPinView *)loginPinView{
    if (!_loginPinView) {
        _loginPinView = [[CTSI_LoginPinView alloc] initWithFrame:CGRectMake(0%2*self.frame.size.width, 0, self.frame.size.width, kScreen_Height/6)];
        _loginPinView.delegate = self;
    }
    return _loginPinView;
}
- (CTSI_LoginAdmView *)loginAdmView{
    if (!_loginAdmView) {
        _loginAdmView = [[CTSI_LoginAdmView alloc] initWithFrame:CGRectMake(1%2*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        _loginAdmView.delegate = self;
    }
    return _loginAdmView;
}


@end
