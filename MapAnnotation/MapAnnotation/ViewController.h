//
//  ViewController.h
//  MapAnnotation
//
//  Created by agile on 01/08/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic,strong)IBOutlet MKMapView *mapView;

@end
