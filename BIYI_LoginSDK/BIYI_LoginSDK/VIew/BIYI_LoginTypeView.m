//
//  BIYI_LoginTypeView.m
//  BIYI_Login
//
//  Created by lcl on 2020/6/9.
//  Copyright © 2020 LCL. All rights reserved.
//

#import "BIYI_LoginTypeView.h"
#import "BIYI_LoginPinView.h"
#import "BIYI_LoginAdmView.h"
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
@interface BIYI_LoginTypeView()<UIScrollViewDelegate,BIYI_LoginPinViewDelegate,BIYI_LoginAdmViewDelegate>
@property (nonatomic, strong) BIYI_LoginPinView *loginPinView;
@property (nonatomic, strong) BIYI_LoginAdmView *loginAdmView;
@property (nonatomic, copy) NSString *type;
@end

@implementation BIYI_LoginTypeView

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
 
#pragma mark - BIYI_LoginAdmViewDelegate

- (void)BIYI_LoginAdmViewDelegateWithUser:(nonnull NSString *)user withPW:(nonnull NSString *)pw withPin:(nonnull NSString *)pin {
    
    [_delegate BIYI_LoginTypeViewDelegateWithUser:user withPW:pw withPin:pin];
}
- (void)BIYI_LoginAdmViewDelegateChangePin{
    [_delegate BIYI_LoginTypeViewDelegateChangePin];
}
#pragma mark - BIYI_LoginPinViewDelegate
- (void)BIYI_LoginPinViewDelegateGetPin{
    [_delegate BIYI_LoginTypeViewDelegateGetPinBtn];
    
}

- (void)BIYI_LoginPinViewDelegateWithTel:(nonnull NSString *)tel withPin:(nonnull NSString *)pin {
     [_delegate BIYI_LoginTypeViewDelegateWithUser:tel withPW:@"" withPin:pin];
}

- (void)setIsShowLoginAdmPinView:(BOOL)isShowLoginAdmPinView{
    
    self.loginAdmView.isShowLoginAdmPinView = isShowLoginAdmPinView;
    
}
- (void)setLength:(int)length{
 
    self.loginPinView.length = length;
}
- (void)setPinImage:(UIImage *)pinImage{
    self.loginAdmView.pinImage = pinImage;
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
- (BIYI_LoginPinView *)loginPinView{
    if (!_loginPinView) {
        _loginPinView = [[BIYI_LoginPinView alloc] initWithFrame:CGRectMake(0%2*self.frame.size.width, 0, self.frame.size.width, kScreen_Height/6)];
        _loginPinView.delegate = self;
    }
    return _loginPinView;
}
- (BIYI_LoginAdmView *)loginAdmView{
    if (!_loginAdmView) {
        _loginAdmView = [[BIYI_LoginAdmView alloc] initWithFrame:CGRectMake(1%2*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        _loginAdmView.delegate = self;
    }
    return _loginAdmView;
}




@end
