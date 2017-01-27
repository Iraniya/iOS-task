//
//  ViewController.m
//  ScrolView
//
//  Created by agile - corner on 10/06/16.
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
//  
//    newView =[[UIView alloc]initWithFrame:CGRectMake(0, 10, 20, 30)];
//    
//    [newView setBackgroundColor:[UIColor grayColor]];
//    self.view =newView;
//    
//    //mainScroll =[[UIScrollView alloc]initWithFrame:CGRectMake(10, 10, 100, 400)];
//    
//    //mainScroll.contentSize = [CGRectMake(10, 10, 200, 500)];
//   // mainScroll.becomeFirstResponder
//    mainScroll.backgroundColor = [UIColor blueColor];
//    secondScroll.backgroundColor =[UIColor lightGrayColor];
    
    
    mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    NSInteger viewcount= 4;
    for(int i = 0; i< viewcount; i++) {
        
        CGFloat y = i * self.view.frame.size.height;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, y,self.view.frame.size.width, self .view.frame.size.height)];
        view.backgroundColor = [UIColor greenColor];
        [mainScroll addSubview:view];
        
    }
    mainScroll.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height *viewcount);
    
    [self.view addSubview:mainScroll];
    
    secondScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    secondScroll.backgroundColor = [UIColor blueColor];
    [secondScroll addSubview:mainScroll];
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
