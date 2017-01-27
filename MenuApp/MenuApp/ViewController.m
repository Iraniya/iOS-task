//
//  ViewController.m
//  MenuApp
//
//  Created by agilemac-74 on 04/04/16.
//  Copyright © 2016 Agile. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic,strong)AppDelegate *appDelegate;
@end

@implementation ViewController
@synthesize appDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    appDelegate = [UIApplication sharedApplication].delegate;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnLeftClick:(id)sender{
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [appDelegate._slideController showLeftViewControllerAnimated:YES];
    }completion:nil];

    
}

-(IBAction)btnRightClick:(id)sender{

    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        [appDelegate._slideController showRightViewControllerAnimated:YES offset:1];
    }completion:nil];

}


@end
