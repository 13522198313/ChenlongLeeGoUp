//
//  BIYI_TabBarController.m
//  BIYI_TabBarControllerSDK
//
//  Created by lcl on 2020/7/24.
//  Copyright © 2020 LCL. All rights reserved.
//

#import "BIYI_TabBarController.h"

@interface BIYI_TabBarController ()
@property (nonatomic, assign) BIYI_TabBarControllerType tabbarType;
@property (nonatomic, assign) CGFloat titleFont;
@end

@implementation BIYI_TabBarController
+ (instancetype)addChildViewControllerArr:(NSArray *)childControllerArr TitleArr:(NSArray *)titleArr withTitleSize:(CGFloat)size andFoneName:(NSString *)foneName selectedImageArr:(NSArray *)selectedImageArr withTitleColor:(UIColor *)selectColor unselectedImageArr:(NSArray *)unselectedImageArr withTitleColor:(UIColor *)unselectColor{
    return [[self alloc] initWithChildViewControllerArr:childControllerArr TitleArr:titleArr withTitleSize:size andFoneName:foneName selectedImageArr:selectedImageArr withTitleColor:selectColor unselectedImageArr:unselectedImageArr withTitleColor:unselectColor];
}
- (instancetype)initWithChildViewControllerArr:(NSArray *)childControllerArr TitleArr:(NSArray *)titleArr withTitleSize:(CGFloat)size andFoneName:(NSString *)foneName selectedImageArr:(NSArray *)selectedImageArr withTitleColor:(UIColor *)selectColor unselectedImageArr:(NSArray *)unselectedImageArr withTitleColor:(UIColor *)unselectColor{
    if (self == [super init]) {
        self.titleFont = size;
        for (int i = 0; i < childControllerArr.count; i ++) {
            [self setTabBarItem:((UIViewController *)childControllerArr[i]).tabBarItem Title:titleArr[i] withTitleSize:size andFoneName:foneName selectedImage:selectedImageArr[i] withTitleColor:selectColor unselectedImage:unselectedImageArr[i] withTitleColor:unselectColor];
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:(UIViewController *)childControllerArr[i]];
            ((UIViewController *)childControllerArr[i]).title = titleArr[i];
            [self addChildViewController:navi];
            
           //[self.moreNavigationController addChildViewController:navi];
        }
    }
    return self;
}

- (void)setTabBarControllerType:(BIYI_TabBarControllerType)tabBarControllerType{
    _tabBarControllerType = tabBarControllerType;
    switch (self.tabBarControllerType) {
        case BIYI_TabBarControllerStatic:
            
            break;
        case BIYI_TabBarControllerDynamic:
        {
            self.selectedIndex = 0;
            self.tabBar.items[0].imageInsets = UIEdgeInsetsMake(- 20, 0, 20, 0);
            [self.tabBar.items[0] setTitlePositionAdjustment:UIOffsetMake(0,- 20)];
            NSDictionary *textTitleOptions = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]};
            [self.tabBar.items[0] setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
            
            break;
        }
        case BIYI_TabBarControllerCamera:
        {
            self.selectedIndex = self.tabBar.items.count/2;
            self.tabBar.items[self.tabBar.items.count/2].imageInsets = UIEdgeInsetsMake(- 20, 0, 20, 0);
            [self.tabBar.items[self.tabBar.items.count/2] setTitlePositionAdjustment:UIOffsetMake(0,- 20)];
            NSDictionary *textTitleOptions = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]};
            [self.tabBar.items[self.tabBar.items.count/2] setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
}

- (void)setTabBarItem:(UITabBarItem *)tabbarItem Title:(NSString *)title withTitleSize:(CGFloat)size andFoneName:(NSString *)foneName selectedImage:(NSString *)selectedImage withTitleColor:(UIColor *)selectColor unselectedImage:(NSString *)unselectedImage withTitleColor:(UIColor *)unselectColor{
    //设置图片
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //未选中字体颜色
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:[UIFont fontWithName:foneName size:size]} forState:UIControlStateNormal];
    //选中字体颜色
    [tabbarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:[UIFont fontWithName:foneName size:size]} forState:UIControlStateSelected];
}


//实现 UITabBarDelegate 代理
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    switch (self.tabBarControllerType) {
        case BIYI_TabBarControllerStatic:
            
            break;
        case BIYI_TabBarControllerDynamic:
            for (UITabBarItem *unSelItem in tabBar.items) {
                if (unSelItem == item) {//选中的设置他的状态
                    item.imageInsets = UIEdgeInsetsMake(- 20, 0, 20, 0);
                    [item setTitlePositionAdjustment:UIOffsetMake(0,- 20)];
                    
                    NSDictionary *textTitleOptions = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:self.titleFont]};
                    [item setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
                }else {//未选中的设置他的状态
                    
                    unSelItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                    [unSelItem setTitlePositionAdjustment:UIOffsetMake(0,0)];
                    NSDictionary *textTitleOptions = @{NSFontAttributeName:[UIFont systemFontOfSize:self.titleFont]};
                    [unSelItem setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
                }
            }
            break;
        case BIYI_TabBarControllerCamera:
            
            break;
        default:
            break;
    }
}

@end
