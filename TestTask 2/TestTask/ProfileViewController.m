//
//  ProfileViewController.m
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "ProfileViewController.h"
#import "CustomeCellSignUpTableViewCell.h"
#import "AppDelegate.h"

@interface ProfileViewController ()
{
    AppDelegate *objApp;
     float initialTVHeight;
}
@end

@implementation ProfileViewController

//Check Keybord Hidden Nad Show
-(id) initWithNibName:(NSString*)nibNameOrNil bundle:nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardDidHideNotification object:nil];
    }
    return self;
}
-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}
-(void) keyboardShown:(NSNotification*) notification
{
    initialTVHeight = tblProfile.frame.size.height;
    CGRect initialFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect convertedFrame = [self.view convertRect:initialFrame fromView:nil];
    CGRect tvFrame = tblProfile.frame;
    tvFrame.size.height = convertedFrame.origin.y;
    tblProfile.frame = tvFrame;
}
-(void) keyboardHidden:(NSNotification*) notification
{
    CGRect tvFrame = tblProfile.frame;
    tvFrame.size.height = initialTVHeight;
    [UIView beginAnimations:@"TableViewDown" context:NULL];
    [UIView setAnimationDuration:0.3f];
    tblProfile.frame = tvFrame;
    [UIView commitAnimations];
}

//Scroll Table Up When Keybord Hide cell

-(void) scrollToCell:(NSIndexPath*) path
{
    [tblProfile scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    objApp=[[UIApplication sharedApplication]delegate];
    arraytxtName=[[NSMutableArray alloc]initWithObjects:@"Id",@"Username/EmailID",@"Fname",@"LastName",@"Password",@"ConformPassword",@"PhoneNo",@"Education",@"Address1",@"Address2",@"Submit", nil];
    arrayPickerEducation=[[NSMutableArray alloc]initWithObjects:@"Education",@"10th",@"12th",@"Greduation",@"Higher Greduation", nil];
    pickerEducation.delegate=self;
    pickerEducation.dataSource=self;
    viewPicker.hidden=true;
    discDataEdit=[[NSMutableDictionary alloc]init];

}

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *UserdefaultDataReg=[NSUserDefaults standardUserDefaults];
    arrayData=[[UserdefaultDataReg valueForKey:@"data"] mutableCopy];
    NSLog(@"%@",arrayData);
    
}

#pragma mark -TableView Method-

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return   arraytxtName.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomeCellSignUpTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil)
    {
        NSArray *arrayNib=[[NSBundle mainBundle]loadNibNamed:@"CustomeCellSignUpTableViewCell" owner:self options:nil];
        cell=(CustomeCellSignUpTableViewCell *)[arrayNib firstObject];
    }
    
    cell.txtSigup.text=[objApp.discUserDetail valueForKey:[arraytxtName objectAtIndex:indexPath.row]];
    
    if (indexPath.row==arraytxtName.count-1)
    {
        cell.txtSigup.hidden=true;
        UIButton *btnSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnSubmit setFrame:CGRectMake(cell.frame.origin.x+100, cell.frame.origin.y+20, 80, 30)];
        [btnSubmit addTarget:self action:@selector(btnSubmit) forControlEvents:UIControlEventTouchUpInside];
        [btnSubmit setTitle:@"Submit" forState:UIControlStateNormal];
        [btnSubmit setBackgroundColor:[UIColor redColor]];
        [cell.contentView addSubview:btnSubmit];
        
    }
    else
    {
        cell.txtSigup.text=[objApp.discUserDetail valueForKey:[arraytxtName objectAtIndex:indexPath.row]];
        cell.txtSigup.delegate=self;
        cell.txtSigup.tag=indexPath.row+1;
        
        if (indexPath.row==0)
        {
            cell.txtSigup.enabled=NO;
            [cell.txtSigup setBackgroundColor:[UIColor lightGrayColor]];
        }
        
        NSLog(@"%d",cell.txtSigup.tag);
    }
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark -PickerView MEthod-

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return arrayPickerEducation.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [arrayPickerEducation objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    UITextField *txtEducationTemp=(UITextField*)[tblProfile viewWithTag:8];
    txtEducationTemp.text=[arrayPickerEducation objectAtIndex:row];
    [discDataEdit setObject:txtEducationTemp.text forKey:@"Education"];
}

#pragma mark -TextField Method-

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag>=4 && textField.tag<=9)
    {
        //Set Scrolling path to Scroll TableView
        
        NSIndexPath* path = [NSIndexPath indexPathForRow:textField.tag+1 inSection:0];
        [self performSelector:@selector(scrollToCell:) withObject:path afterDelay:0.5f];
    }

    if (textField.tag==8)
    {
        [textField resignFirstResponder];
        viewPicker.hidden=false;
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [discDataEdit setObject:textField.text forKey:[arraytxtName objectAtIndex:textField.tag-1]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//--Button Submit Method--

-(void)btnSubmit
{
    [discDataEdit setObject:[objApp.discUserDetail valueForKey:@"Id"] forKey:@"Id"];
    int userId=[[objApp.discUserDetail valueForKey:@"Id"]intValue];
    int ReplaceIndex=  userId-1;
    [arrayData replaceObjectAtIndex:ReplaceIndex withObject:discDataEdit];
    NSLog(@"%@",arrayData);
    [[NSUserDefaults standardUserDefaults]setObject:arrayData forKey:@"data"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

//--PickerView Done Button MEthod--

- (IBAction)btnDone:(id)sender
{
    viewPicker.hidden=true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
