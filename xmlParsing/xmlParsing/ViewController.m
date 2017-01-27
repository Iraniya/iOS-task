//
//  ViewController.m
//  xmlParsing
//
//  Created by agile on 7/1/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerCell.h"
#import "DetailsViewController.h"
@interface ViewController ()
{
    DetailsViewController *delailsViewControllerObject;
}
@end

@implementation ViewController
{
    NSMutableDictionary *currentFoodDict;
    NSString *currentElement;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *xmlFilePath = [[NSBundle mainBundle]pathForResource:@"simple" ofType:@"xml"];
    
    parser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL fileURLWithPath:xmlFilePath]];
   
    [parser setDelegate:self];
    [parser parse];
    
    if (!resturantDataArray)
    {
        resturantDataArray = [[NSMutableArray alloc]init];
    }
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    currentElement = elementName;
    
    if ( [elementName isEqualToString:FOOD])
    {
        if (!currentFoodDict) {
            currentFoodDict = [[NSMutableDictionary alloc]init];
        }
        
        return;
    }
    
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:ITEM_PRICE]) {
        currentElement = elementName;
    }else if ([elementName isEqualToString:ITEM_NAME]){
        currentElement = elementName;    }
    else if ([elementName isEqualToString:ITEM_DESCRIPTION]){
        currentElement = elementName;
    }else if ([elementName isEqualToString:ITEM_CALORIES]){
        currentElement = elementName;
    }
    
    if ([elementName isEqualToString:FOOD])
    {
        if (!resturantDataArray) {
            resturantDataArray = [[NSMutableArray alloc]init];
        }
        [resturantDataArray addObject:[currentFoodDict copy]];
        [currentFoodDict removeAllObjects];
    }
 
    NSLog(@"array = %@",resturantDataArray);
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    if ([string rangeOfString:@"\n"].location == NSNotFound) {
        if ([currentElement isEqualToString:ITEM_PRICE]) {
            [currentFoodDict setObject:string forKey:ITEM_PRICE];
        }else if ([currentElement isEqualToString:ITEM_NAME]){
            [currentFoodDict setObject:string forKey:ITEM_NAME];
        }else if ([currentElement isEqualToString:ITEM_DESCRIPTION]){
            [currentFoodDict setObject:string forKey:ITEM_DESCRIPTION];
        }else if ([currentElement isEqualToString:ITEM_CALORIES]){
            [currentFoodDict setObject:string forKey:ITEM_CALORIES];
        }
    }
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return resturantDataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *currentItemDetails = [resturantDataArray objectAtIndex:indexPath.row];
    NSString *text = currentItemDetails[ITEM_DESCRIPTION];
    
    // typical textLabel.frame = {{10, 30}, {260, 22}}
    const CGFloat TEXT_LABEL_WIDTH = 260;
    CGSize constraint = CGSizeMake(TEXT_LABEL_WIDTH, 20000);
    
    // typical textLabel.font = font-family: "Helvetica"; font-weight: bold; font-style: normal; font-size: 18px
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping]; // requires iOS 6+
    const CGFloat CELL_CONTENT_MARGIN = 22;
    CGFloat height = MAX(CELL_CONTENT_MARGIN + size.height, 44);
    
    return height;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        
        NSArray *arrayNib=[[NSBundle mainBundle]loadNibNamed:@"ViewControllerCell" owner:self options:nil];
        
        cell = (ViewControllerCell *)[arrayNib firstObject];
    }
    NSDictionary *currentItemDetails = [resturantDataArray objectAtIndex:indexPath.row];
    cell.name.text = @"Name : ";
    cell.details.text =@"Price : ";
    [cell.name sizeToFit];
    [cell.details sizeToFit];
    cell.foodName.text = [currentItemDetails objectForKey:ITEM_NAME];
    [cell.foodName sizeToFit];
    cell.foodDetails.text = [currentItemDetails objectForKey:ITEM_PRICE];
    [cell.foodDetails sizeToFit];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    delailsViewControllerObject =[[DetailsViewController alloc]initWithNibName:@"DetailsViewController" bundle:nil] ;
    NSLog(@"re%@",resturantDataArray);
    NSDictionary *currentItemDetails = [resturantDataArray objectAtIndex:indexPath.row];
   
    /*
    //for main lable name
    delailsViewControllerObject.foodlable.text =[currentItemDetails objectForKey:ITEM_NAME];
    [delailsViewControllerObject.foodlable sizeToFit];
    
    delailsViewControllerObject.foodPrice.text= [currentItemDetails objectForKey:ITEM_PRICE];
    [delailsViewControllerObject.foodPrice sizeToFit];
    
    delailsViewControllerObject.foodCalaories.text =[currentItemDetails objectForKey:ITEM_CALORIES];
    [delailsViewControllerObject.foodCalaories sizeToFit];
    
    delailsViewControllerObject.foodDescription.text= [currentItemDetails objectForKey:ITEM_DESCRIPTION];
    [delailsViewControllerObject.foodDescription sizeToFit];
    */
    
    delailsViewControllerObject.currentFoodDetails = [[NSMutableDictionary alloc]init];
   delailsViewControllerObject.currentFoodDetails = currentItemDetails ;
    NSLog(@"current%@",delailsViewControllerObject.currentFoodDetails);
    [self.navigationController pushViewController:delailsViewControllerObject animated:YES];
    [tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
