//
//  ViewController.m
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

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated
{
    //for navigation bar to hide
    self.navigationController.navigationBarHidden = true;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *acceptedCharacters = @"0123456789";
    
    NSUInteger newLength = [userNumber.text length] + [string length] - range.length;
    return (newLength = 10) ? NO : YES;
    
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:acceptedCharacters] invertedSet];
    
    NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    return [string isEqualToString:filtered];
    
    
    return YES;
}


/*
 button action to go to Disney Land View Class when user will click on DisneyLand Button
 */


 -(IBAction)Disneyland:(id)sender
{
    /* second view controller object*/
    secoundViewController *disneyObject =[[secoundViewController alloc]initWithNibName:@"secoundViewController" bundle:nil];
    
    [self.navigationController pushViewController:disneyObject animated:YES];
}

/*
 Button action to go to Antarctica View Class when user will click on Antarctica Button
 */

-(IBAction)Antarctica:(id)sender
{
    thirdViewController *antarcticaObject =[[thirdViewController new]initWithNibName:@"thirdViewController" bundle:nil];
    
    [self.navigationController pushViewController:antarcticaObject animated:YES];
}

-(IBAction)Lasvagas:(id)sender
{
    FourthViewController *lasVagasObject =[[FourthViewController new]initWithNibName:@"FourthViewController" bundle:nil];
    
    [self.navigationController pushViewController:lasVagasObject animated:YES];
}

-(IBAction)Ladakh:(id)sender
{
    FifthViewController *ladakhObject =[[FifthViewController new]initWithNibName:@"FifthViewController" bundle:nil];
    
    [self.navigationController pushViewController:ladakhObject animated:YES];
}



@end
