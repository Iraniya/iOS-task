//
//  DetailsViewController.h
//  xmlParsing
//
//  Created by agile on 01/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ITEM_NAME @"name"
#define FOOD @"food"
#define ITEM_PRICE @"price"
#define ITEM_DESCRIPTION @"description"
#define ITEM_CALORIES @"calories"
@interface DetailsViewController : UIViewController
{
    
}
@property IBOutlet UILabel *foodlable;
@property IBOutlet UILabel *foodName;
@property IBOutlet UILabel *foodPrice;
@property IBOutlet UILabel *foodCalaories;
@property IBOutlet UILabel *foodDescription;
@property (nonatomic,strong)NSDictionary *currentFoodDetails;
@end
