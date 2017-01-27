//
//  fistViewController.m
//  Dynamic Lable
//
//  Created by agile on 04/06/16.
//  Copyright (c) 2016 Agile. All rights reserved.
//

#import "fistViewController.h"

@interface fistViewController ()

@end

@implementation fistViewController

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
   
    self.navigationController.navigationBarHidden = YES;
    
    view = [[UIView alloc]initWithFrame:CGRectMake(25,25,200,self.view.frame.size.height)];
    
    [view setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:view];
    [self CreateLabel];
}

-(void)CreateLabel
{
//    Create an Array for Label Name
    
    NSMutableArray *arrayLabel = [NSMutableArray new];
    
//    [arrayLabel addObject:@"1"];
//    [arrayLabel addObject:@"2"];
//    [arrayLabel addObject:@"3"];
//    [arrayLabel addObject:@"4"];
//    [arrayLabel addObject:@"5"];
//    [arrayLabel addObject:@"6"];
//    [arrayLabel addObject:@"7"];
//    [arrayLabel addObject:@"8"];
//    [arrayLabel addObject:@"9"];
//    [arrayLabel addObject:@"10"];
//    [arrayLabel addObject:@"11"];
//    [arrayLabel addObject:@"12"];
//    [arrayLabel addObject:@"13"];
//    [arrayLabel addObject:@"14"];
   
//   Height and Width
    
    int viewWidth = view.frame.size.width;
    
    int buttonWidth = 70;
    int buttonHeight = 30;
    
/*  For spcae between two buttons */
    
    int temp = viewWidth / buttonWidth;
    int xSpace = (viewWidth-(temp*buttonWidth))/(temp+1);
    if (xSpace < 10)
    {
        temp--;
        xSpace = (viewWidth-(temp*buttonWidth))/(temp+1);
    }
    int ySpace = xSpace;
    
//    Create Labels
    
    if (viewWidth > (buttonWidth+(2*xSpace)))
    {
    int size = viewWidth - buttonWidth;
    int xPos = xSpace;
    int yPos = ySpace;
    
    for (int i=0; i<[arrayLabel count]; i++)
    {
        if (xPos > size)
        {
            yPos = yPos + ySpace + buttonHeight;
            xPos = xSpace;
        }
        
        UILabel *lbl =[[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos,buttonWidth,buttonHeight)];
        
        lbl.text = [arrayLabel objectAtIndex:i];
        lbl.backgroundColor = [UIColor blackColor];
        lbl.textColor = [UIColor whiteColor];
        [view addSubview:lbl];
        xPos = xPos + buttonWidth +xSpace;
    }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
