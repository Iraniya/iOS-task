//
//  ViewController.m
//  JsonParsing
//
//  Created by agile on 04/07/16.
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
    [self getJsonContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//get Json Content 
-(void)getJsonContent
{
    NSString *strFilePath = [[NSBundle mainBundle] pathForResource:@"demo3" ofType:@"json"];
    NSString *stringURl = @"www.google.com";
    
    NSData *dataremp = [[NSData alloc] initWithContentsOfURL:stringURl];
    NSData *dataJson = [[NSData alloc] initWithContentsOfFile:strFilePath];
    
    NSError *error;
    
    NSMutableDictionary *dictJson = [NSJSONSerialization JSONObjectWithData:dataJson options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"%@",dictJson);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-
@end
