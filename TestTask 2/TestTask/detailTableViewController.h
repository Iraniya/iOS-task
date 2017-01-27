//
//  detailTableViewController.h
//  TestTask
//
//  Created by agile on 27/06/16.
//  Copyright (c) 2016 agile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tblDetail;
    NSString *strName;
    NSMutableArray *arrayData;
}

@end
