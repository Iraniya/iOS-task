//
//  ProfileViewController.h
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, UITabBarDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    IBOutlet UITableView *tblProfile;
    IBOutlet UIView *viewPicker;
    IBOutlet  UIPickerView *pickerEducation;
    NSMutableArray *arrayPickerEducation;
    NSMutableDictionary *discDataEdit;
    NSMutableArray *arrayData;
    NSMutableArray *arraytxtName;
}

- (IBAction)btnDone:(id)sender;

@end
