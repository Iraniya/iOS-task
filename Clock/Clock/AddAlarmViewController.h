//
//  AddAlarmViewController.h
//  Clock
//
//  Created by agile on 8/9/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAlarmViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *dataPicker;

- (void)presentMessage:(NSString *)message;
- (void)scheduleLocalNotificationWithDate:(NSDate *)fireDate;

@end
