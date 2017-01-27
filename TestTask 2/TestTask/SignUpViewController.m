//
//  SignUpViewController.m
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "SignUpViewController.h"
#import "CustomeCellSignUpTableViewCell.h"
#import "AppDelegate.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController
{
    AppDelegate *objApp;
    float initialTVHeight;
}
//Check Keybord Hidden Nad Show
-(id) initWithNibName:(NSString*)nibNameOrNil bundle:nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShown:) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardDidHideNotification object:nil];
    }
    return self;
}
-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}
-(void) keyboardShown:(NSNotification*) notification {
    initialTVHeight = tableSignUp.frame.size.height;
    CGRect initialFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect convertedFrame = [self.view convertRect:initialFrame fromView:nil];
    CGRect tvFrame = tableSignUp.frame;
    tvFrame.size.height = convertedFrame.origin.y;
    tableSignUp.frame = tvFrame;
}
-(void) keyboardHidden:(NSNotification*) notification {
    CGRect tvFrame = tableSignUp.frame;
    tvFrame.size.height = initialTVHeight;
    [UIView beginAnimations:@"TableViewDown" context:NULL];
    [UIView setAnimationDuration:0.3f];
    tableSignUp.frame = tvFrame;
    [UIView commitAnimations];
}

//Scroll Table Up When Keybord Hide cell

-(void) scrollToCell:(NSIndexPath*) path
{
    [tableSignUp scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    objApp=[[UIApplication sharedApplication]delegate];
    arraytxtName=[[NSMutableArray alloc]initWithObjects:@"Id",@"Username/EmailID",@"Fname",@"LastName",@"Password",@"ConformPassword",@"PhoneNo",@"Education",@"Address1",@"Address2",@"Submit", nil];
    arrayPickerEducation=[[NSMutableArray alloc]initWithObjects:@"Education",@"10th",@"12th",@"Greduation",@"Higher Greduation", nil];
    pickerEducation.delegate=self;
    pickerEducation.dataSource=self;
    viewPicker.hidden=true;
    arrayData=[[NSMutableArray alloc]init];
    discData=[[NSMutableDictionary alloc]init];
    
    NSUserDefaults *UserdefaultDataReg=[NSUserDefaults standardUserDefaults];
    NSArray  *arrayData2=[[UserdefaultDataReg valueForKey:@"data"] mutableCopy];
    NSLog(@"VDLdatainREG=%@",arrayData2);
    NoCount=arrayData2.count+1;
    [tableSignUp setContentSize:CGSizeMake(320, 50000)];
    
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
    if (indexPath.row==arraytxtName.count-1)
    {
        cell.txtSigup.hidden=true;
        btnSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
        [btnSubmit setFrame:CGRectMake(cell.frame.origin.x+117, cell.frame.origin.y+20, 80, 30)];
        [btnSubmit addTarget:self action:@selector(btnSubmit) forControlEvents:UIControlEventTouchUpInside];
        [btnSubmit setTitle:@"SUBMIT" forState:UIControlStateNormal];
        [btnSubmit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cell.contentView addSubview:btnSubmit];
        
    }
    else
    {
        cell.txtSigup.tag=indexPath.row+1;
        cell.txtSigup.delegate=self;
        
        if (indexPath.row==0)
        {
            cell.txtSigup.text=[NSString stringWithFormat:@"%d",NoCount];
            cell.txtSigup.enabled=NO;
            [cell.txtSigup setBackgroundColor:[UIColor lightGrayColor]];
        }
        
        else
        {
            
            cell.txtSigup.text=[discData valueForKey:[arraytxtName objectAtIndex:indexPath.row]];
            cell.txtSigup.placeholder=[arraytxtName objectAtIndex:indexPath.row];
        }
        
    }
    
return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
    
}

#pragma mark- PickerView MEthod-

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
    UITextField *txtEducationTemp=(UITextField*)[tableSignUp viewWithTag:8];
    txtEducationTemp.text=[arrayPickerEducation objectAtIndex:row];
    [discData setObject:txtEducationTemp.text forKey:@"Education"];
}

//Done Button Of PickerView Method-

- (IBAction)btnDonePicker:(id)sender
{
    viewPicker.hidden=true;
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
    [discData setObject:textField.text forKey:[arraytxtName objectAtIndex:textField.tag-1]];
    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    //--- TextFeld Validation ---
    
    if (textField.tag==5)
    {
        NSString *stricterFilterString = @"^(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d$@$!%*?&]{12,20}";
        NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
        BOOL check= [passwordTest evaluateWithObject:textField.text];
        
        if (check==0)
        {
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter atlist 1 Number And 1 capital letter in Password lengh shoud be in range og 12 to 20" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
            [alt show];
            return NO;
        }
        
        else if (textField.text.length<12 || textField.text.length>20)
        {
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter Pasword within rage of 12 to 20" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
            [alt show];
            return NO;
            
        }
    }
    
    if (textField.tag==6)
    {
        UITextField *txtTemp=(UITextField *)[tableSignUp viewWithTag:5];
        if ([textField.text isEqualToString:txtTemp.text] )
        {
            return YES;
        }
        
        else
        {
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Password Not Match" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
            [alt show];
            return NO;
        }
    }
    
    if (textField.tag==7)
    {
        if (textField.text.length <10 || textField.text.length>10)
        {
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@"Please enter Valid Contact No" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
            [alt show];
            return NO;
        }
        
        else
        {
            [textField resignFirstResponder];
            return YES;
            
        }
    }
 return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField.tag==3 || textField.tag==4)
    {
        NSCharacterSet *allowedCharacters = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        NSCharacterSet *allowedCharacters2 = [[NSCharacterSet letterCharacterSet] invertedSet];
        
        if (([string rangeOfCharacterFromSet:allowedCharacters].location == NSNotFound))
        {
            if (([string rangeOfCharacterFromSet:allowedCharacters2].location == NSNotFound))
            {
                return YES;
                
            }
            else
            {
                UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"Alert View" message:@" Only Charachter are allowed" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
                [alt show];
                return NO;
            }
        }
    }
    
    if (textField.tag==7)
    {
        if (textField.text.length==10)
        { [textField resignFirstResponder];
            return NO;
            
        }
    }
    return YES;
   
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -SubmitButton Method-

-(void)btnSubmit
{
    [discData setObject:[NSString stringWithFormat:@"%d",NoCount] forKey:@"Id"];
    NSLog(@"%@",discData);
    NSUserDefaults *UserdefaultDataReg=[NSUserDefaults standardUserDefaults];
    arrayData=[[UserdefaultDataReg valueForKey:@"data"] mutableCopy];
    if (!arrayData)
    {
        arrayData=[[NSMutableArray alloc]init];
        [arrayData addObject:discData];
    }
    else
    {
        [arrayData addObject:discData];
        
    }
   
    [UserdefaultDataReg setObject:arrayData forKey:@"data"];
    [[NSUserDefaults standardUserDefaults ]synchronize];
    objApp.discUserDetail=discData;
    [self.navigationController pushViewController:objApp.objTb animated:YES];
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
