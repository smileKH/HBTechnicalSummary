//
//  AppDelegate.m
//  HBTechnicalSummary
//
//  Created by Mac on 2020/10/11.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import "AppDelegate.h"
#import "HBContentRootVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =  [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    HBContentRootVC *vc = [[HBContentRootVC alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    //动画
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    self.window.rootViewController = navi;
    [self.window.layer addAnimation:anima forKey:@"revealAnimation"];
    [self.window makeKeyAndVisible];
    return YES;
}





@end
