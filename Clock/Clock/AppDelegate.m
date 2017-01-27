//
//  AppDelegate.m
//  Clock
//
//  Created by agile on 8/9/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize tabBarControllerObject;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self settingTabBarController];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - SettingTabBarController

//Setting TabBarController
-(void)settingTabBarController
{
    self.tabBarControllerObject = [[UITabBarController alloc]init];
    
    //creating objects for tabbar
    FirstViewController *clockViewControllerObject=[[FirstViewController alloc]init];
    
    SecondViewController *alarmViewControllerObject=[[SecondViewController alloc]init];
    
    ThirdViewController *stopWatchViewControllerObject=[[ThirdViewController alloc]init];
    
    FourthViewController *timerViewControllerObject=[[FourthViewController alloc]init];
    
    
    //creating object for navigating tab bar
    UINavigationController *clockNavigationObject=[[UINavigationController alloc]initWithRootViewController:clockViewControllerObject];
    
    UINavigationController *alarmNavigationObject=[[UINavigationController alloc]initWithRootViewController:alarmViewControllerObject];
    
    UINavigationController *stopWatchNavigationObject=[[UINavigationController alloc]initWithRootViewController:stopWatchViewControllerObject];
    
    UINavigationController *timerNavigationObject=[[UINavigationController alloc]initWithRootViewController:timerViewControllerObject];
    
    //storing all views in array
    NSArray *viewControllerObjectsArray=[[NSArray alloc]initWithObjects:clockNavigationObject,alarmNavigationObject,stopWatchNavigationObject,timerNavigationObject, nil];
    
    //setting views in tabbarcontroller
    [self.tabBarControllerObject setViewControllers:viewControllerObjectsArray];
    
    //setting title for views
    UITabBarItem *clockItem=[self.tabBarControllerObject.tabBar.items objectAtIndex:0];
    clockItem.title=@"Clock";
    
    UITabBarItem *alarmItem=[self.tabBarControllerObject.tabBar.items objectAtIndex:1];
    alarmItem.title=@"Alarm";
    
    UITabBarItem *stopWatchItem=[self.tabBarControllerObject.tabBar.items objectAtIndex:2];
    stopWatchItem.title=@"StopWatch";
    
    UITabBarItem *timerItem = [self.tabBarControllerObject.tabBar.items objectAtIndex:3];
    timerItem.title =@"Timer";
}


@end
