//
//  DyanmicaddSubMaeksViewController.h
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DyanmicaddSubMaeksViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIScrollView *ScrollDynamicVC;
    NSString *subject;
    NSString *Marks;
    int subjejInt;
    UITextField *txtMarks;
    UITextField *txtSubject;
    NSMutableDictionary *discSubject;
    NSMutableDictionary *discMarks;
    NSMutableDictionary *discResult;
    NSMutableArray *arrayResult;
    NSMutableDictionary *discIdividualResult;
    NSMutableArray *arrayTodisplayMarks;
    NSMutableDictionary *discToDisplayMarks;
    NSString *btnName;
}
@property(nonatomic,strong)NSMutableArray *arrayMarks;
@property(nonatomic,strong)NSString *EditIndex;
@end
