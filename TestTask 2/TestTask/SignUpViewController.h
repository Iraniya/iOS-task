//
//  SignUpViewController.h
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    IBOutlet UIView *viewPicker;
    IBOutlet UIToolbar *toolbar;
    IBOutlet UITableView *tableSignUp;
    IBOutlet  UIPickerView *pickerEducation;
    NSMutableArray *arraytxtName;
    NSMutableArray *arrayPickerEducation;
    NSMutableDictionary *discData;
    NSMutableArray *arrayData;
    UIButton *btnSubmit;
    int NoCount;
}

- (IBAction)btnDonePicker:(id)sender;

@end
