//task 4
//  main.m
//  arrayDict
//
//  Created by agile - corner on 26/05/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

@interface SampleClass : NSObject
-(NSString*)findString:(NSArray*)array andIndex :(int)i;

-(void)setNewValue:(NSString*)string andNewName:(NSString*)name andUserArray:(NSArray*)array andIndex :(int)i;

@end

@implementation SampleClass

-(NSString*)findString:(NSArray*)array andIndex:(int)i
{
    NSDictionary *findDict = [NSDictionary new];
    findDict = [array objectAtIndex:i];
    return [findDict objectForKey:@"Id"];
}

-(void)setNewValue:(NSString *)string andNewName:(NSString *)name andUserArray:(NSArray *)array andIndex:(int)i
{
    NSDictionary *findDict =[NSDictionary new];
    findDict = [array objectAtIndex:i];
    [findDict setValue:string forKey:@"Id"];
    [findDict setValue:name forKey:@"Name"];
}

@end

int main(int argc, char * argv[])
{
    //1st user details
    NSMutableDictionary *user1DetailsDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1],@"Id",@"ABC",@"Name", nil];
    
    //2nd User details
    NSMutableDictionary *user2DetailDict   = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:2],@"Id",@"XYZ",@"Name", nil];
    
    //3rd user details
    NSMutableDictionary *user3DetailsDict = [NSMutableDictionary new];
    [user3DetailsDict setValue:@"03" forKey:@"Id"];
    [user3DetailsDict setValue:@"three" forKey:@"Name"];
    //[user3DetailsDict setValue:user1DetailsDict forKey:@"Development"];
    
    //4th user Details
    NSMutableDictionary *user4DetailsDict   = [NSMutableDictionary new];
    [user4DetailsDict setValue:@"04" forKey:@"Id"];
    [user4DetailsDict setValue:@"Four" forKey:@"Name"];
    //[user4DetailsDict setObject:user2DetailDict forKey:@"Development"];
   
    
    //array of all user details
    NSMutableArray *userArray = [NSMutableArray arrayWithObjects:user1DetailsDict,user2DetailDict, nil];
    
    //fist time print user array
    NSLog(@"%@",userArray);
    
    /* Part 1 dictonary of array of user deatails with key activity and development*/
    
    NSMutableDictionary *detailsDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:userArray,@"Activity",userArray,@"Development", nil];
    
    /* Part 2 dictonary of array of dictonary */
    
   // NSDictionary *development = [NSDictionary dictionaryWithObjectsAndKeys:user1DetailsDict,@"development", nil];
   
    //New User Details
    NSMutableArray *newUserArray = [NSMutableArray new];
    [newUserArray arrayByAddingObject:user3DetailsDict];
    [newUserArray arrayByAddingObject:user4DetailsDict];
    
   
    //NSLog(@"%@",detailsDict);
    
    /*finding array element */
    //NSDictionary *findDict = [NSDictionary new];
    //findDict = [userArray objectAtIndex:0];
    
    /*finding value in dict*/
    //NSString *findString = [findDict objectForKey:@"Id"];
    
    //[findDict setValue:@"00" forKey:@"Id"];
    
    SampleClass *sampleclass =[SampleClass new];
    NSString *findString = [sampleclass findString:userArray andIndex:0];
    
    NSLog(@"%@",findString);
    
    [sampleclass setNewValue:@"123" andNewName:@"naynesh" andUserArray:userArray andIndex:0];
    
    NSLog(@"%@",userArray);
    
    findString = [sampleclass findString:userArray andIndex:0];
    
    NSLog(@"%@",findString);
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
