//
//  SecondViewController.h
//  CustomDelegate
//
//  Created by agilepc-140 on 04/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol MyCustomDelegate <NSObject>
@required
-(void)getName:(NSString*)stringName;
@optional
-(void)changeName:(NSString*)FirstName;
@end

@interface SecondViewController : UIViewController
@property (nonatomic,strong) id<MyCustomDelegate>delegateObject;
@end