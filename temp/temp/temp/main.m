//
//  main.m
//  temp
//
//  Created by agile on 01/01/01.
//  Copyright (c) 2001 Agile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        int j=0;
        NSString *pr=@"";
        
        NSArray *ar=[[NSArray alloc]initWithObjects:@"ganesha",@"krishan",@"gopal", nil];
        ar
        for(j=0;j<=3;j++)
        {
            pr=[ar objectAtIndex:j];
            NSLog(@"%@",pr);
        }
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
