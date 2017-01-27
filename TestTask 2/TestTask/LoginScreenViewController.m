//
//  LoginScreenViewController.m
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "LoginScreenViewController.h"
#import "SignUpViewController.h"
#import "AppDelegate.h"

@interface LoginScreenViewController ()

@end

@implementation LoginScreenViewController
{
    AppDelegate *objApp;

}
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
    objApp=[[UIApplication sharedApplication]delegate];
    [ScrollViewLogin setContentSize:CGSizeMake(320, ScrollViewLogin.frame.size.height+100)];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    //---Get Regestration Data---
    
    NSUserDefaults *UserdefaultDataReg=[NSUserDefaults standardUserDefaults];
    arrayData=[[UserdefaultDataReg valueForKey:@"data"] mutableCopy];
    NSLog(@"VWLdatainLogin=%@",arrayData);
    NSString *str= [[UserdefaultDataReg valueForKey:@"isLogin"] mutableCopy];
    NSLog(@"str=%@",str);
    objApp=[[UIApplication sharedApplication]delegate];
}

#pragma mark- Button Method-

- (IBAction)btnSigIn:(id)sender
{
    for (int i=0; i<arrayData.count; i++)
    {
        NSMutableDictionary *disccheck=[arrayData objectAtIndex:i];
        NSString *strEmail=[disccheck valueForKey:@"Username/EmailID"];
        NSString *strPsw=[disccheck valueForKey:@"Password"];
        
        if ([txtUserName.text isEqualToString:strEmail])
        {
            if ([txtPassword.text isEqualToString:strPsw])
            {
                objApp.discUserDetail=disccheck;
                NSLog(@"%@",objApp.discUserDetail);
                [self.navigationController pushViewController:objApp.objTb animated:YES];
                [self.navigationController setNavigationBarHidden:YES];
                txtUserName.text=@"";
                txtPassword.text=@"";
                
                break;
            }
        }
        if (i==arrayData.count-1)
        {
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"please enter valid username or Password" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
            [alt show];
        }
    }
}

- (IBAction)btnSigUp:(id)sender
{
    SignUpViewController *objSignup=[[SignUpViewController alloc]init];
    [self.navigationController pushViewController:objSignup animated:YES];
}

#pragma mark- TextField Method-

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
