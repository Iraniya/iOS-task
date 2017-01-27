//
//  ViewController.m
//  FileManager
//
//  Created by agilepc-140 on 06/07/16.
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
    
    userArray = [[NSMutableArray alloc]initWithObjects:@"Naynesh",@"Palak",@"Deepti",@"Urvish",@"Jaydeep", nil];
    
    [self createFolderInDocumentDirectory:@"Palak"];
}

#pragma mark - Create folder

-(void)createFolderInDocumentDirectory:(NSString*)folderName
{
    //storing path of app in array ( becz NSSearchPathForDirectoriesInDomains returns array)
    NSArray *aryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSFileManager *fileManager =[NSFileManager defaultManager];

    NSString *documentPath = [aryPath firstObject];
    
    //adding user folder in document folder
    documentPath = [documentPath stringByAppendingString:[NSString stringWithFormat:@"/%@",folderName]];
    
    [fileManager createDirectoryAtPath:documentPath withIntermediateDirectories:YES attributes:nil error:nil];
   
    NSLog(@"strPath%@",documentPath);
    
    //to store image in folder
   NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"veg.jpeg"], 1.0);

    NSString *filePath = [documentPath stringByAppendingPathComponent:@"veg.jpeg"]; //Add the file name
    [imageData writeToFile:filePath atomically:YES]; //Write the file
    NSLog(@"file path : %@",filePath);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
