//
//  ViewController.m
//  TextField
//
//  Created by agile - corner on 09/06/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _userName.placeholder = @"User Name";
    _userName.background = [UIColor whiteColor];
    _userNumber.placeholder = @"User Phone";
    _specialCharacter.placeholder =@"SpecialCharacter";
    _userName.textColor = [UIColor blackColor];
    
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
	
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger newLength = [_userName.text length];
    return (newLength > 10) ? NO : YES;
}


@end
