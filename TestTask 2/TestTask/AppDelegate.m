//
//  AppDelegate.m
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginScreenViewController.h"
#import "ProfileViewController.h"
#import "SettingViewController.h"
#import "EducationViewController.h"

@implementation AppDelegate
@synthesize discUserDetail;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // arrayData=[[NSMutableArray alloc]init];
    discUserDetail=[[NSMutableDictionary alloc]init];
    self.objTb=[[UITabBarController alloc]init];
    
    [self TabBarController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    LoginScreenViewController *objLogin=[[LoginScreenViewController alloc]init];
    UINavigationController *objNavi=[[UINavigationController alloc]initWithRootViewController:objLogin];
    [self.window setRootViewController:objNavi];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)TabBarController
{
    EducationViewController *objEdu=[[EducationViewController alloc]init];
    ProfileViewController *objProfile=[[ProfileViewController alloc]init];
    SettingViewController *objSetting=[[SettingViewController alloc]init];
    
    UINavigationController *objNaviEdu=[[UINavigationController alloc]initWithRootViewController:objEdu];
    UINavigationController *ObjNaviProfile=[[UINavigationController alloc]initWithRootViewController:objProfile];
    UINavigationController *ObjNaviSetting=[[UINavigationController alloc]initWithRootViewController:objSetting];
    
    NSArray *arrayVC=[[NSArray alloc]initWithObjects:objNaviEdu,ObjNaviProfile,ObjNaviSetting, nil];
    [self.objTb setViewControllers:arrayVC];
    
    UITabBarItem *itemEdu=[self.objTb.tabBar.items objectAtIndex:0];
    itemEdu.title=@"Education";
    UITabBarItem *itemProfile=[self.objTb.tabBar.items objectAtIndex:1];
    itemProfile.title=@"Profile";
    UITabBarItem *itemSetting=[self.objTb.tabBar.items objectAtIndex:2];
    itemSetting.title=@"Setting";
    
}

@end
