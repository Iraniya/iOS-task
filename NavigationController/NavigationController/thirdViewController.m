//
//  thirdViewController.m
//  NavigationController
//
//  Created by agile - corner on 01/06/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//
#import "ViewController.h"
#import "secoundViewController.h"
#import "thirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface thirdViewController ()

@end

@implementation thirdViewController

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


-(IBAction)Lasvagas:(id)sender
{
    FourthViewController *fouthvc =[[FourthViewController new]initWithNibName:@"FourthViewController" bundle:nil];
    [self.navigationController pushViewController:fouthvc animated:YES];
}
-(IBAction)Ladakh:(id)sender
{
    FifthViewController *fifthvc =[[FifthViewController new]initWithNibName:@"FifthViewController" bundle:nil];
    [self.navigationController pushViewController:fifthvc animated:YES];
}



/* Click to go to main menu*/

-(IBAction)mainMenu:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 Back button event
 */
-(IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
