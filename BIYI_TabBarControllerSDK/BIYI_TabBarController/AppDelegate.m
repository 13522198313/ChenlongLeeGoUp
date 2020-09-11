//
//  AppDelegate.m
//  BIYI_TabBarController
//
//  Created by lcl on 2020/9/11.
//  Copyright © 2020 LCL. All rights reserved.
//
#define KFONT 12
#import "AppDelegate.h"
#import <BIYI_TabBarControllerSDK/BIYI_TabBarControllerSDK.h>
#import "AVC.h"
#import "BVC.h"
#import "CVC.h"
#import "DVC.h"
#import "EVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
       [self.window setBackgroundColor:[UIColor whiteColor]];
       
       AVC *a = [[AVC alloc] init];
       BVC *b = [[BVC alloc] init];
       CVC *c = [[CVC alloc] init];
       DVC *d = [[DVC alloc] init];
       EVC *e = [[EVC alloc] init];
       
       NSArray *controllerArr = @[a,b,c,d,e];
       NSArray *titleArr = @[@"首页",@"分类",@"发现",@"购物车",@"我的",@"相机"];
       NSArray *selectedImageArr = @[@"cuihuashan_1",@"huangdiling_1",@"huaqinggong_1",@"xianbowuguan_1",@"xiaoyanta_1",@"xiangji"];//xiangji
       NSArray *unselectedImageArr = @[@"cuihuashan",@"huangdiling",@"huaqinggong",@"xianbowuguan",@"xiaoyanta",@"xiangji"];//xiangji

       BIYI_TabBarController *tabbar = [BIYI_TabBarController addChildViewControllerArr:controllerArr TitleArr:titleArr withTitleSize:KFONT andFoneName:@"Marion-Italic" selectedImageArr:selectedImageArr withTitleColor:[UIColor redColor] unselectedImageArr:unselectedImageArr withTitleColor:[UIColor blackColor]];
       
      //   tabbar.tabBarControllerType = BIYI_TabBarControllerStatic;
      // tabbar.tabBarControllerType = BIYI_TabBarControllerDynamic;
     tabbar.tabBarControllerType = BIYI_TabBarControllerCamera;
       
       self.window.rootViewController = tabbar;
       [self.window makeKeyAndVisible];
         return YES;
}

//
//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
