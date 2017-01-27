//
//  main.m
//  sortArray
//
//  Created by agile - corner on 22/05/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    NSMutableArray *newArray = [[NSMutableArray alloc] init];
    
    newArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:24],[NSNumber numberWithInt:23],[NSNumber numberWithInt:78],[NSNumber numberWithInt:34], nil];
    
    int length = [newArray count];
    
    for (int i =0 ; i<length; i++) {
        for (int j =1; j<length-1 ; j++) {
            
            int vari    = [newArray objectAtIndex:i];
            NSLog(@"i =%@",newArray[i]);
        
            int varj    = [newArray objectAtIndex:j];
            NSLog(@"j= %@",newArray[j]);
        
            if ([newArray objectAtIndex:i] < [newArray objectAtIndex:j])
            {
                id tempObj = [newArray objectAtIndex:i];
                NSLog(@"%@",tempObj);
            
                [newArray replaceObjectAtIndex:i withObject:[newArray objectAtIndex:j]];
                NSLog(@"replace i %@",newArray[i]);
                [newArray replaceObjectAtIndex:j withObject:tempObj];
                NSLog(@"replace j%@",newArray[j]);
            }
        }
    }
    
    //priting array
    
    NSLog(@"%@",newArray);

@autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
