//
//  detailTableViewController.m
//  TestTask
//
//  Created by agile on 27/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "detailTableViewController.h"
#import "AppDelegate.h"

@interface detailTableViewController ()
{
    AppDelegate *objApp;
}
@end

@implementation detailTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    objApp=[[UIApplication sharedApplication]delegate];
}
-(void)viewWillAppear:(BOOL)animated
{
    //---Get Regestration Data---
    
    NSUserDefaults *UserdefaultDataReg=[NSUserDefaults standardUserDefaults];
    arrayData=[[UserdefaultDataReg valueForKey:@"data"] mutableCopy];
    NSLog(@"%@",arrayData);
    NSString *str= [[UserdefaultDataReg valueForKey:@"isLogin"] mutableCopy];
    NSLog(@"str=%@",str);
    objApp=[[UIApplication sharedApplication]delegate];
    NSSortDescriptor *discriptor=[NSSortDescriptor sortDescriptorWithKey:@"Fname" ascending:YES];
    [arrayData sortUsingDescriptors:@[discriptor]];
    NSLog(@"%@",arrayData);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -TableView Method-

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    strName=[objApp.discUserDetail valueForKey:@"Fname"];
    [cell setBackgroundColor:[UIColor blueColor]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    [cell.detailTextLabel setTextColor:[UIColor whiteColor]];
    cell.textLabel.text=[[arrayData objectAtIndex:indexPath.row]valueForKey:@"Fname"];
    cell.detailTextLabel.text=[[arrayData objectAtIndex:indexPath.row]valueForKey:@"PhoneNo"];
    
 return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewHeader=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    [viewHeader setBackgroundColor:[UIColor blueColor]];
    UILabel *labHeaderTitle=[[UILabel alloc]initWithFrame:CGRectMake(viewHeader.frame.origin.x+20, viewHeader.frame.origin.y+10, 100, 20)];
    // [labHeaderTitle setBackgroundColor:[UIColor whiteColor]];
    NSString *strSectionName=[strName substringToIndex:1];
    [labHeaderTitle setText:strSectionName];
    [labHeaderTitle setBackgroundColor:[UIColor blueColor]];
    [labHeaderTitle setTextColor:[UIColor whiteColor]];
    [viewHeader addSubview:labHeaderTitle];
    
 return viewHeader;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

@end
