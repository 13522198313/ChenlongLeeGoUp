//
//  CTSI_TabBarController.h
//  CTSI_TabBarControllerSDK
//
//  Created by lcl on 2020/7/24.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger,CTSI_TabBarControllerType){
        CTSI_TabBarControllerStatic = 0,
        CTSI_TabBarControllerDynamic  = 1,
        CTSI_TabBarControllerCamera = 2
};
@interface CTSI_TabBarController : UITabBarController

@property (nonatomic, assign, readwrite) CTSI_TabBarControllerType tabBarControllerType;
+ (instancetype)addChildViewControllerArr:(NSArray *)childControllerArr TitleArr:(NSArray *)titleArr withTitleSize:(CGFloat)size andFoneName:(NSString *)foneName selectedImageArr:(NSArray *)selectedImageArr withTitleColor:(UIColor *)selectColor unselectedImageArr:(NSArray *)unselectedImageArr withTitleColor:(UIColor *)unselectColor;

@end

NS_ASSUME_NONNULL_END
