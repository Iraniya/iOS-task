//
//  ViewControllerCell.h
//  xmlParsing
//
//  Created by agile on 7/1/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UILabel *foodName;
@property(nonatomic,strong) IBOutlet UILabel *name;
@property (nonatomic,strong) IBOutlet UILabel *details;
@property (nonatomic,strong) IBOutlet UILabel *foodDetails;

@end
