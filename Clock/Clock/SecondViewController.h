//
//  SecondViewController.h
//  Clock
//
//  Created by agile on 8/9/16.
//  Copyright (c) 2016 Iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *alarmArray;
    
    
    IBOutlet UITableView *tableViewObject;
}
@end

