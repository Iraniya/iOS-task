
//
//  FifthViewController.m
//  NavigationController
//
//  Created by agile - corner on 03/06/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//
#import "ViewController.h"
#import "secoundViewController.h"
#import "thirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

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
}

-(void)viewWillAppear:(BOOL)animated
{
    //for navigation bar to hide
    self.navigationController.navigationBarHidden = true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*buttons to go backward (to pop view)*/

/*
 button action to go to Disney Land View Class when user will click on
 DisneyLand Button
 */
-(IBAction)Disneyland:(id)sender
{
    secoundViewController *secvc =[[secoundViewController alloc]initWithNibName:@"secoundViewController" bundle:nil];
    [self.navigationController popToViewController:secvc animated:YES];
}

-(IBAction)Antarctica:(id)sender
{
    thirdViewController *thirdVC =[[thirdViewController new]initWithNibName:@"thirdViewController" bundle:nil];
    [self.navigationController popToViewController:thirdVC animated:YES];
}
-(IBAction)lasVagas:(id)sender
{
    FourthViewController *fourthVC  = [[FourthViewController new]initWithNibName:@"FourthViewController" bundle:nil];
    [self.navigationController popToViewController:fourthVC animated:YES];
}

/*main menu event */

-(IBAction)mainMenu:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*
 Back button event
 */
-(IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
