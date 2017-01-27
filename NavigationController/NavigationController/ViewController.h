//
//  ViewController.h
//  NavigationController
//
//  Created by agile - corner on 01/06/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *userName, *userNumber, *other;
    UILabel *lnlName;
}

-(IBAction)btnClick:(id)sender;
@end
