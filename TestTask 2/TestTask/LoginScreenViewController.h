//
//  LoginScreenViewController.h
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginScreenViewController : UIViewController<UIScrollViewDelegate,UITextFieldDelegate>
{
    IBOutlet UIScrollView *ScrollViewLogin;
    IBOutlet UITextField *txtUserName;
    IBOutlet UITextField *txtPassword;
    NSMutableArray *arrayData;
}

- (IBAction)btnSigIn:(id)sender;
- (IBAction)btnSigUp:(id)sender;


@end
