//
//  DyanmicaddSubMaeksViewController.m
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import "DyanmicaddSubMaeksViewController.h"
#import "EducationViewController.h"
#import "AppDelegate.h"

@interface DyanmicaddSubMaeksViewController ()
{
    AppDelegate *objApp;
}
@end

@implementation DyanmicaddSubMaeksViewController
@synthesize arrayMarks,EditIndex;

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
    [ScrollDynamicVC setContentSize:CGSizeMake(320, 800)];
    objApp=[[UIApplication sharedApplication]delegate];
    NSLog(@"%@",arrayMarks);
    NSLog(@"%@",EditIndex);
    
    discMarks=[[NSMutableDictionary alloc]init];
    discSubject=[[NSMutableDictionary alloc]init];
    discResult=[[NSMutableDictionary alloc]init];
    discIdividualResult=[[NSMutableDictionary alloc]init];
    
    discToDisplayMarks=[[NSMutableDictionary alloc]init];
    arrayTodisplayMarks= [[[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"result%@",[objApp.discUserDetail valueForKey:@"Id"]]]mutableCopy];
   
    NSLog(@"%@",arrayTodisplayMarks);
    int index=[EditIndex intValue];
    discToDisplayMarks=[arrayTodisplayMarks objectAtIndex:index];
    
    if (!EditIndex)
    {
        subjejInt= [[[arrayMarks objectAtIndex:0]valueForKey:@"Subject"] intValue];
        NSLog(@"%d",subjejInt);
        btnName=@"SUBMIT";
        [self SetUpView];
    }
    
    else
    {
        
        subjejInt=[[discToDisplayMarks valueForKey:@"totalSubject"] intValue];
        btnName=@"EDIT";
        [self SetUpView];
        
        for (int i=1; i<=subjejInt+subjejInt; i++)
        {
            UITextField *txtTemp=(UITextField *)[ScrollDynamicVC viewWithTag:i];
            
            if (txtTemp.tag<=subjejInt)
            {
                txtTemp.text=[[discToDisplayMarks valueForKey:@"AllSubject"]valueForKey:[NSString stringWithFormat:@"Subject%d",i]];
            }
            else
            {
                NSLog(@"%@",[discToDisplayMarks valueForKey:@"Allmarks"]);
                
                NSLog(@"%@",[[discToDisplayMarks valueForKey:@"Allmarks"]valueForKey:[NSString stringWithFormat:@"Marks%d",i-subjejInt]]);
                txtTemp.text=[[discToDisplayMarks valueForKey:@"Allmarks"]valueForKey:[NSString stringWithFormat:@"Marks%d",i-subjejInt]];
            }
        }
    }
    NSLog(@"%@",discToDisplayMarks);
    NSLog(@"editIndex=%@",EditIndex);
  //  discMarks=[[NSMutableDictionary alloc]init];
  //  discSubject=[[NSMutableDictionary alloc]init];
 //   discResult=[[NSMutableDictionary alloc]init];
    
}
-(void)SetUpView
{
    int xPos=40,yPos=100,height=35,width=100;
    for (int i=1; i<=subjejInt; i++)
    {
        txtSubject=[[UITextField alloc]initWithFrame:CGRectMake(xPos, yPos, width, height)];
        [txtSubject setBorderStyle:UITextBorderStyleRoundedRect];
        txtSubject.placeholder=[NSString stringWithFormat:@"Subject%d",i];
        txtSubject.tag=i;
        txtSubject.delegate=self;
        [ScrollDynamicVC addSubview:txtSubject];
        xPos=xPos+width+20;
        
        txtMarks=[[UITextField alloc]initWithFrame:CGRectMake(xPos, yPos, width, height)];
        [txtMarks setBorderStyle:UITextBorderStyleRoundedRect];
        txtMarks.placeholder=[NSString stringWithFormat:@"Marks%d",i];
        txtMarks.tag=i+subjejInt;
        txtMarks.delegate=self;
        [ScrollDynamicVC addSubview:txtMarks];
        xPos=xPos+width+20;
        
        UILabel *lblTotalMarks=[[UILabel alloc]initWithFrame:CGRectMake(xPos, yPos, width, height)];
        [lblTotalMarks setText:@"/100"];
        [lblTotalMarks setTextColor:[UIColor whiteColor]];
        [ScrollDynamicVC addSubview:lblTotalMarks];
        yPos=yPos+height+20;
        xPos=40;
    }
    
    UIButton *btnSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
    [btnSubmit setFrame:CGRectMake(xPos+50, yPos, width, height)];
    [btnSubmit setTitle:btnName forState:UIControlStateNormal];
    [btnSubmit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSubmit addTarget:self action:@selector(btnSubmitClick) forControlEvents:UIControlEventTouchUpInside];
    [ScrollDynamicVC addSubview:btnSubmit];
}

#pragma mark - TextField MEthod--

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    /*
    if (textField.tag<=subjejInt)
    {
        
        [discSubject setObject:textField.text forKey:[NSString stringWithFormat:@"Subject%d",textField.tag] ];
    }
    
    else
    {
        [discMarks setObject:textField.text forKey:[NSString stringWithFormat:@"Marks%d",textField.tag-subjejInt]];
    }
  */
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [textField resignFirstResponder];
    return YES;
}

//--btnclick Method--

-(void)btnSubmitClick
{
    for (int i=1; i<=subjejInt+subjejInt; i++)
    {
        UITextField *txtTemp=(UITextField*)[ScrollDynamicVC viewWithTag:i];
        if (txtTemp.tag<=subjejInt)
        {
            
            [discSubject setObject:txtTemp.text forKey:[NSString stringWithFormat:@"Subject%d",txtTemp.tag] ];
        }
        
        else
        {
            [discMarks setObject:txtTemp.text forKey:[NSString stringWithFormat:@"Marks%d",txtTemp.tag-subjejInt]];
        }
        
        
    }
    NSLog(@"sub=%@,marks=%@",discSubject,discMarks);
    int totalSum=0;
    int percentage;

    for (int i=1; i<=subjejInt; i++)
    {
        int marks=[[discMarks valueForKey:[NSString stringWithFormat:@"Marks%d",i]] intValue];
        totalSum=totalSum+marks;
    }
    
    NSLog(@"totalsum=%d",totalSum);
    percentage=((100*totalSum)/(100*subjejInt));
    NSLog(@"%d",percentage);
    [discResult setObject:discSubject forKey:@"AllSubject"];
    [discResult setObject:discMarks forKey:@"Allmarks"];
    [discResult setObject:[objApp.discUserDetail valueForKey:@"Id"] forKey:@"Id"];
    if (!EditIndex)
    {
    [discResult setObject:[[arrayMarks objectAtIndex:0]valueForKey:@"Semester"] forKey:@"Sem"];
    }
    
    else
    {
        [discResult setObject:[discToDisplayMarks valueForKey:@"Sem"] forKey:@"Sem"];
    }
    
    [discResult setObject:[NSNumber numberWithInt:percentage] forKey:@"percentage"];
    [discResult setObject:[NSNumber numberWithInt:subjejInt] forKey:@"totalSubject"];
    
    if (percentage>=70)
    {
        [discResult setObject:@"Disctintion" forKey:@"Grade"];
    }
    
    else if (percentage<70 && percentage>=60)
    {
        [discResult setObject:@"A" forKey:@"Grade"];
    }
    
    else if (percentage<60 && percentage>=50)
    {
        [discResult setObject:@"B" forKey:@"Grade"];
    }
    
    else if (percentage<50 && percentage>=35)
    {
        [discResult setObject:@"c" forKey:@"Grade"];
        
    }
    else if (percentage<35)
    {
        [discResult setObject:@"Fail" forKey:@"Grade"];
    }
    
    else
    {
        [discResult setObject:@"NotFound" forKey:@"Grade"];
    }
    
    NSLog(@"%@",discResult);
   // [discIdividualResult setObject:discResult forKey:[NSString stringWithFormat:@"persone%@",[objApp.discUserDetail valueForKey:@"Id"]]];
   
    arrayResult= [[[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"result%@",[objApp.discUserDetail valueForKey:@"Id"]]]mutableCopy];
    if ([btnName isEqualToString:@"EDIT"])
    {
        [arrayResult replaceObjectAtIndex:[EditIndex intValue] withObject:discResult];
    }
    
    else
    {
      if (!arrayResult)
      {
          arrayResult=[[NSMutableArray alloc]init];
          [arrayResult addObject:discResult];
      }
        
    else
    {
        [arrayResult addObject:discResult];
    }
        
 }
    [[NSUserDefaults standardUserDefaults]setObject:arrayResult forKey:[NSString stringWithFormat:@"result%@",[objApp.discUserDetail valueForKey:@"Id"]]];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //EducationViewController *objEdu=[[EducationViewController alloc]init];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self.view endEditing:YES];
}

@end
