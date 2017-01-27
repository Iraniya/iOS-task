//
//  AddSubMArksViewController.h
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSubMArksViewController : UIViewController
{
    IBOutlet UITextField *txtSubject;
    IBOutlet UITextField *txtxSemester;
    NSMutableArray *arrayMark;
    NSMutableDictionary *discMark;
}

- (IBAction)btnadd:(id)sender;

@end
