//
//  ViewController.m
//  CountController
//
//  Created by agile - corner on 11/06/16.
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
    
    //inizilization to zero
    
    int  countView = 0, CountLabel = 0, CountButton = 0, countTextField = 0,countSubViewButton;
    
    
    /* sample array  to store number of count and the increment the count */
    
    
    for (NSArray *sampleArray in self.view.subviews) {
        
        if ([sampleArray isKindOfClass:[UITextField class]]) {
            countTextField++;
        }
        
        else if ([sampleArray isKindOfClass:[UILabel class]]) {
            CountLabel++;
        }
        
        else if ([sampleArray isKindOfClass:[UIButton class]]) {
            CountButton++;
        }
        
        else if ([sampleArray isKindOfClass:[UIView class]]) {
            countView++;
        }
        // NSLog(@"%@",sampleArray);
    }


}
- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
