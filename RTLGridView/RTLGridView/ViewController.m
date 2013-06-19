//
//  ViewController.m
//  RTLGridView
//
//  Created by Moayad Al kouz on 6/19/13.
//  Copyright (c) 2013 Moayad Al kouz. All rights reserved.
//

#import "ViewController.h"
#import "RTLGridView.h"
#import "BusinessService.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize services;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initilizeGrid];
    }
    return self;
}

-(void) initilizeGrid{
    self.services =  [[NSMutableArray alloc] initWithArray:[BusinessService getSampleData]];
    
    gridView = [[RTLGridView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andItems:self.services];
    //    [gridView setTag:300 + x];
    //[gridView setCellHeight:260];
    //[gridView setCellWidth:323];
    //[gridView setNumOfRows:2];
    gridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:gridView];
    [gridView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
   
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [gridView reloadData];
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    
    [gridView reloadData];
}

-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}

@end
