//
//  DetailsViewController.m
//  xmlParsing
//
//  Created by agile on 01/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController
@synthesize foodlable,foodName,foodCalaories,foodDescription,foodPrice,currentFoodDetails;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    foodlable.text=[currentFoodDetails objectForKey:ITEM_NAME];
    [foodlable sizeToFit];
    
    foodName.text=[currentFoodDetails objectForKey:ITEM_NAME];
    [foodName sizeToFit];
    
    foodPrice.text= [currentFoodDetails objectForKey:ITEM_PRICE];
    [foodPrice sizeToFit];
    
    foodCalaories.text =[currentFoodDetails objectForKey:ITEM_CALORIES];
    [foodCalaories sizeToFit];
    
    foodDescription.text= [currentFoodDetails objectForKey:ITEM_DESCRIPTION];
    [foodDescription sizeToFit];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
