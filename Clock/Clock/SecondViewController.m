//
//  SecondViewController.m
//  Clock
//
//  Created by agile on 8/9/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import "SecondViewController.h"
#import "MyCell.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    alarmArray = [[NSMutableArray alloc]init];
    [alarmArray addObject:@"ok"];
}

#pragma mark - Navigation Controler
-(void)SetNavigation
{
    //[self navigationControlle
    
}
#pragma mark - TableView Methods


//rows in a section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return alarmArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //creating cell object
    MyCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //if cell is nil (for 1st time without reusable)
    if (cell==nil) {
        NSArray *arrayNib=[[NSBundle mainBundle]loadNibNamed:@"MyCell" owner:self options:nil];
        cell = (MyCell *)[arrayNib firstObject];
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
