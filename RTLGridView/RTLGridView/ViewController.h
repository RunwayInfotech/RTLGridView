//
//  ViewController.h
//  RTLGridView
//
//  Created by Moayad Al kouz on 6/19/13.
//  Copyright (c) 2013 Moayad Al kouz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLGridView.h"
@interface ViewController : UIViewController
{
    RTLGridView * gridView;
}
@property (nonatomic, retain) NSMutableArray * services;
-(void) initilizeGrid;
@end
