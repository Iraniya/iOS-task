//
//  ViewController.m
//  DynamicViewController
//
//  Created by agile on 01/01/01.
//  Copyright (c) 2001 iraniya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *view;

}

@end

@implementation ViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //custom initi
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBarHidden = YES;
    
    view = [[UIView new]initWithFrame:CGRectMake(0,20,190,self.view.frame.size.height)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:view];
    [self CreateLabel];

}

-(void)CreateLabel
{
    NSMutableArray *arrayLabel = [NSMutableArray new];
    [arrayLabel addObject:@"First"];
    [arrayLabel addObject:@"1"];
    [arrayLabel addObject:@"Second"];
    [arrayLabel addObject:@"2"];
    [arrayLabel addObject:@"Third"];
    [arrayLabel addObject:@"3"];
    [arrayLabel addObject:@"Forth"];
    [arrayLabel addObject:@"4"];
    [arrayLabel addObject:@"Fifth"];
    [arrayLabel addObject:@"5"];
    [arrayLabel addObject:@"Sixth"];
    [arrayLabel addObject:@"6"];
    [arrayLabel addObject:@"Seventh"];
    [arrayLabel addObject:@"7"];
    
    
    // Height and Width
    
    int viewWidth = view.frame.size.width;
    
    int width = 70;
    int height = 30;
    
    //    Create a Space between two Label
    
    int temp = viewWidth / width;
    int xSpace = (viewWidth-(temp*width))/(temp+1);
    if (xSpace < 10)
    {
        temp--;
        xSpace = (viewWidth-(temp*width))/(temp+1);
    }
    int ySpace = xSpace;
    
    //    Create Labels
    
    if (viewWidth > (width+(2*xSpace)))
    {
        int size = viewWidth - width;
        int xPos = xSpace;
        int yPos = ySpace;
        
        for (int i=0; i<[arrayLabel count]; i++)
        {
            if (xPos > size)
            {
                yPos = yPos + ySpace + height;
                xPos = xSpace;
            }
            
            UILabel *lbl =[[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos,width,height)];
            
            lbl.text = [arrayLabel objectAtIndex:i];
            lbl.backgroundColor = [UIColor blackColor];
            lbl.textColor = [UIColor whiteColor];
            [view addSubview:lbl];
            xPos = xPos + width +xSpace;
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
