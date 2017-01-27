//
//  ViewController.m
//  Mini Calc
//
//  Created by agile on 06/06/16.
//  Copyright (c) 2016 Agile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    lblAnswer.text  = @"I am Waiting for Your Answer...";
    lblAnswer.textColor =[ UIColor greenColor];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)BtnAddition:(UIButton *)sender
{
    int firstvalue = [txtfirst.text intValue];
    int secondvalue =[txtSecond.text intValue];
    
    lblAnswer.text = [NSString stringWithFormat:@" Your Answer is : %d",firstvalue+secondvalue];
}

- (IBAction)BtnMultiplication:(UIButton *)sender
{
    int firstvalue = [txtfirst.text intValue];
    int secondvalue =[txtSecond.text  intValue];
    
    lblAnswer.text = [NSString stringWithFormat:@" Your Answer is : %d",firstvalue*secondvalue];
}

- (IBAction)BtnSubtraction:(UIButton *)sender
{
    int firstvalue = [txtfirst.text intValue];
    int secondvalue =[txtSecond.text  intValue];
    
    lblAnswer.text = [NSString stringWithFormat:@" Your Answer is : %d",firstvalue-secondvalue];
}
- (IBAction)BtnDivision:(UIButton *)sender
{
    float firstvalue = [txtfirst.text intValue];
    float secondvalue =[txtSecond.text  intValue];
    
    lblAnswer.text = [NSString stringWithFormat:@" Your Answer is : %.2f",firstvalue/secondvalue];
}
- (IBAction)BtnClear:(UIButton *)sender
{
    txtfirst.text = @"";
    txtSecond.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
