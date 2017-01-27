//
//  main.m
//  dictReplace
//
//  Created by agile on 27/05/16.
//  Copyright (c) 2016 Agile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    NSMutableDictionary *dict1 = [NSMutableDictionary new];
    [dict1 setObject:@"01" forKey:@"ID"];
    [dict1 setObject:@"ABC" forKey:@"Name"];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary new];
    [dict2 setObject:@"02" forKey:@"Id"];
    [dict2 setObject:@"XYZ" forKey:@"Name"];
    
    NSMutableArray *arr1   =[NSMutableArray arrayWithObjects:dict1,dict2, nil];
    
    NSMutableDictionary *newDict = [NSMutableDictionary new];
    [newDict setObject:arr1 forKey:@"Activity"];
    [newDict setObject:arr1 forKey:@"development"];
    [newDict setValue:[arr1 replaceObjectAtIndex:0 withObject:([dict1 setObject:@"Naynesh" forKey:@"Name"])] forKey:@"Activity"];
    [new ]
    
    
    
    NSLog(@"%@",newDict);
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
