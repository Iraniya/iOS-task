//
//  EducationViewController.m
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "EducationViewController.h"
#import "CustomeCellEducationTableViewCell.h"
#import "DyanmicaddSubMaeksViewController.h"
#import "AddSubMArksViewController.h"
#import "AppDelegate.h"

@interface EducationViewController ()
{
    AppDelegate *objApp;
}
@end

@implementation EducationViewController

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
    
    //---Add Plush Button to Navigationbar---
    
    
    objApp=[[UIApplication sharedApplication]delegate];
    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(plushbtnclick)];
    [self.navigationItem setRightBarButtonItem:plusButton];
    
    [tableEducation reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    arrayResult=[[[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"result%@",[objApp.discUserDetail valueForKey:@"Id"]]] mutableCopy];
    NSLog(@"EducationViewController ArrayResult=%@",arrayResult);
 /*   for (NSMutableDictionary *objDisc in arrayResult)
    {
        if ([objDisc isKindOfClass:[NSMutableDictionary class]])
        {
            if ([[objDisc valueForKey:@"Id"]isEqualToString:[objApp.discUserDetail valueForKey:@"Id"]])
            {
                if(!arrayIndividualResult)
                    
             {
                arrayIndividualResult=[[NSMutableArray alloc]init];
                [arrayIndividualResult addObject:objDisc];
                NSLog(@"%@",arrayIndividualResult);
             }
            }
        }
        
    }*/
    [tableEducation reloadData];
}

#pragma mark -TableView Method-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return  arrayResult.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomeCellEducationTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil)
    {
        NSArray *arrayNib=[[NSBundle mainBundle]loadNibNamed:@"CustomeCellEducationTableViewCell" owner:self options:nil];
        cell=(CustomeCellEducationTableViewCell *)[arrayNib firstObject];
    }
    
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    cell.lblSem.text=[[arrayResult objectAtIndex:indexPath.row]valueForKey:@"Sem"];
    cell.lblPercentage.text=[NSString stringWithFormat:@"%@",[[arrayResult objectAtIndex:indexPath.row]valueForKey:@"percentage"]];
    cell.lblGrade.text=[[arrayResult objectAtIndex:indexPath.row]valueForKey:@"Grade"];
return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strIndex=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    DyanmicaddSubMaeksViewController *objDynamic=[[DyanmicaddSubMaeksViewController alloc]init];
    objDynamic.EditIndex=strIndex;
    [self.navigationController pushViewController:objDynamic animated:YES];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSString *strIndex=[NSString stringWithFormat:@"%d",indexPath.row];
    DyanmicaddSubMaeksViewController *objDynamic=[[DyanmicaddSubMaeksViewController alloc]init];
    objDynamic.EditIndex=strIndex;
    [self.navigationController pushViewController:objDynamic animated:YES];
}

//--Navigation Plushbutton Method--

-(void)plushbtnclick
{
    AddSubMArksViewController *objAdd=[[AddSubMArksViewController alloc]init];
    [self.navigationController pushViewController:objAdd animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
