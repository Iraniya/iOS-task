//
//  EducationViewController.h
//  TestTask
//
//  Created by agilepc-140 on 25/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EducationViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tableEducation;
    NSMutableArray *arrayResult;
    NSMutableArray *arrayIndividualResult;
}


@end
