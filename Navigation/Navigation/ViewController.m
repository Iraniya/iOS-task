//
//  ViewController.m
//  Navigation
//
//  Created by agilemac-74 on 19/05/16.
//  Copyright © 2016 Agile. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
      //  NSLog(@"%@",    self.navigationController.viewControllers);
        NSLog(@"First ::  viewDidLoad");
    
    
    NSLog(@"%@",self.view);
    
    NSString *strText= @"ajshdasdjk jksah";
    //CGSize size = [strText sizeWithFont:<#(UIFont *)#> forWidth:<#(CGFloat)#> lineBreakMode:NSLineBreakByWordWrapping];
    
    lblName = [[UILabel alloc] initWithFrame:CGRectMake(50, 70,100 ,50)];
    lblName.text = [NSString stringWithFormat:@"Testing \n * \n Test"];
    lblName.numberOfLines = 2;
    lblName.font = [UIFont fontWithName:@"Arial" size:18.0];
    [lblName setBackgroundColor:[UIColor redColor]];
    //lblName.backgroundColor=[UIColor redColor];
    [self.view addSubview:lblName];
    
    [lblName removeFromSuperview];
    
    [self.view sendSubviewToBack:lblName];
    [self.view bringSubviewToFront:lblName];
    
    UIButton *btnTest = [UIButton buttonWithType:UIButtonTypeCustom];

    [btnTest setTitle:@"click" forState:UIControlStateNormal];
    [btnTest setBackgroundColor:[UIColor redColor]];
    btnTest.titleLabel.font = [UIFont systemFontOfSize:20];
    [btnTest setFrame:CGRectMake(60, 200, 90, 80)];
    [btnTest addTarget:self action:@selector(btnTempClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnTest];
    
    
}
-(void)btnTempClick1
{
    
}
-(void)btnTempClick:(UIButton *)sender
{
    [sender setTitle:@"hello" forState:UIControlStateNormal];
}
//-(void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//        NSLog(@"First :: viewDidAppear");
//}
//-(void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//        NSLog(@"First :: viewDidDisappear");
//}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    NSLog(@"First :: viewWillAppear");
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    NSLog(@"First :: viewWillDisappear");
//    NSMutableArray *arr;
////    int a = [self MethodName:<#(NSMutableArray *)#> withString:<#(NSString *)#>];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(int)MethodName:(NSMutableArray *)arr withString:(NSString *)str
{
    return 10;
}
#pragma mark - Button MEthods
-(void)btnClick:(id)sender
{
  //  NSLog(@"%@",self.navigationController);
  //  NSLog(@"%@",self.view);
    
    SecondViewController *objSecond = [[SecondViewController alloc] init];
    self.navigationController.navigationBarHidden = false;
    [self.navigationController pushViewController:objSecond animated:YES];
    
}

@end
