//
//  AddSubMArksViewController.m
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "AddSubMArksViewController.h"
#import "DyanmicaddSubMaeksViewController.h"

@interface AddSubMArksViewController ()

@end

@implementation AddSubMArksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    arrayMark=[[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//--This Button Add Marks And Subject In disctionary---

- (IBAction)btnadd:(id)sender
{
    discMark=[[NSMutableDictionary alloc]init];
    [discMark setObject:txtSubject.text forKey:@"Subject"];
    [discMark setObject:txtxSemester.text forKey:@"Semester"];
    [arrayMark addObject:discMark];
    DyanmicaddSubMaeksViewController *objDynamic=[[DyanmicaddSubMaeksViewController alloc]init];
    objDynamic.arrayMarks=arrayMark;
    [self.navigationController pushViewController:objDynamic animated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
