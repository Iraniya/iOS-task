//
//  main.m
//  structDemo
//
//  Created by agile - corner on 25/05/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"


typedef struct bioData{
    NSString *userName ;
    NSString *dateOfBirth;
    NSString *courseName;
    NSString *addressName;
    NSNumber *phoneNumber;
    int rollNumber;
};

@interface SampleClass : NSObject
-(int)printBioData:(struct bioData *) user;
@end

@implementation SampleClass

-(int) printBioData:(struct bioData *)user {

    NSLog(@"User Name : %@",user->userName);
    NSLog(@"User date of birth : %@",user->dateOfBirth);
    NSLog(@"User Course Name : %@",user->courseName);
    NSLog(@"User adderss Name : %@",user->addressName );
    NSLog(@"User Phone Name : %@",user->phoneNumber);
    NSLog(@"User roll number : %@",user->rollNumber );
}

@end

int main(int argc, char * argv[])
{
    
    struct bioData nayneshIraniya;
    struct bioData palakPatel;
    
    nayneshIraniya.rollNumber = 1;
    nayneshIraniya.userName = @"Iraniya Naynesh";
    nayneshIraniya.addressName = @"Ahmedabad";
    nayneshIraniya.courseName = @"Btech(ICT)";
    nayneshIraniya.dateOfBirth = @"4 March 1994";
    nayneshIraniya.phoneNumber = [NSNumber numberWithInt:12343];
    
    palakPatel.rollNumber = 2;
    palakPatel.userName = @"Pala patel";
    palakPatel.phoneNumber = [NSNumber numberWithInt:428429345];
    palakPatel.addressName = @"Ahmedabad";
    palakPatel.courseName =@"Mtech";
    palakPatel.dateOfBirth =@"30 march 1994";
    
    SampleClass *sampleClass = [[SampleClass alloc]init];
    [sampleClass printBioData:&nayneshIraniya];
    [sampleClass printBioData:&palakPatel];
    
    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
