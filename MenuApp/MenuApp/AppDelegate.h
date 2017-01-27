//
//  AppDelegate.h
//  MenuApp
//
//  Created by agilemac-74 on 04/04/16.
//  Copyright © 2016 Agile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKDSlideViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) MKDSlideViewController *_slideController;
@property (strong, nonatomic) LeftViewController *leftViewController;
@property (strong, nonatomic) RightViewController *rightViewController;



@end

