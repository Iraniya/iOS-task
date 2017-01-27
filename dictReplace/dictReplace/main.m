//
//  main.m
//  dictReplace
//
//  Created by agilemac-151 on 5/27/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
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
    [newDict setObject:[] forKey:@"Activity"];
    
    
    NSLog(@"%@",newDict);
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
