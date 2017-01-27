//
//  LeftViewController.m
//  MenuApp
//
//  Created by agilemac-74 on 04/04/16.
//  Copyright © 2016 Agile. All rights reserved.
//

#import "LeftViewController.h"
#import "AppDelegate.h"
#import "FirstViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)btnPush_CLick:(id)sender{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FirstViewController *firstViewController = [story instantiateViewControllerWithIdentifier:@"firstViewController"];
    [appDelegate._slideController showMainViewControllerAnimated:YES];
    [appDelegate.navController pushViewController:firstViewController animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
