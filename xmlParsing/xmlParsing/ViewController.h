//
//  ViewController.h
//  xmlParsing
//
//  Created by agile on 7/1/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ITEM_NAME @"name"
#define FOOD @"food"
#define ITEM_PRICE @"price"
#define ITEM_DESCRIPTION @"description"
#define ITEM_CALORIES @"calories"

@interface ViewController : UIViewController<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *resturantDataArray;
    NSXMLParser *parser;
    IBOutlet UITableView *tableViewObject;
}
@end

