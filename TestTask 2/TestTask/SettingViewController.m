//
//  SettingViewController.m
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginScreenViewController.h"
#import "detailTableViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    arraySetting=[[NSMutableArray alloc]initWithObjects:@"Logout",@"Contact", nil];
}

#pragma mark -TableView Method-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arraySetting.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }    [cell setBackgroundColor:[UIColor blueColor]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    cell.textLabel.text=[arraySetting objectAtIndex:indexPath.row];
 return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        LoginScreenViewController *objLogin=[[LoginScreenViewController alloc]init];
        [self.navigationController pushViewController:objLogin animated:YES];
       
        /* Not Wotking---
        for (UIViewController *objView in self.navigationController.viewControllers)
        {
            if ([objView isKindOfClass:[LoginScreenViewController class]])
            {
                objLogin=( LoginScreenViewController *)objView;
                break;
            }
        } */
      //  [self.navigationController popToViewController:objLogin animated:YES];
       // [objLogin.navigationController popToRootViewControllerAnimated:YES];
    }

    else if (indexPath.row==1)
    {
        detailTableViewController *objDetail=[[detailTableViewController alloc]init];
        [self.navigationController pushViewController:objDetail animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
