//
//  BIYI_TabBarController.h
//  BIYI_TabBarControllerSDK
//
//  Created by lcl on 2020/7/24.
//  Copyright © 2020 LCL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger,BIYI_TabBarControllerType){
        BIYI_TabBarControllerStatic = 0,
        BIYI_TabBarControllerDynamic  = 1,
        BIYI_TabBarControllerCamera = 2
};
@interface BIYI_TabBarController : UITabBarController

@property (nonatomic, assign, readwrite) BIYI_TabBarControllerType tabBarControllerType;
+ (instancetype)addChildViewControllerArr:(NSArray *)childControllerArr TitleArr:(NSArray *)titleArr withTitleSize:(CGFloat)size andFoneName:(NSString *)foneName selectedImageArr:(NSArray *)selectedImageArr withTitleColor:(UIColor *)selectColor unselectedImageArr:(NSArray *)unselectedImageArr withTitleColor:(UIColor *)unselectColor;

@end

NS_ASSUME_NONNULL_END
