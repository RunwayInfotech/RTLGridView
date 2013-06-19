//
//  FavoritesCellView.h
//  MyAQGridView
//
//  Created by Moayad Al kouz on 6/18/13.
//  Copyright (c) 2013 Moayad Al kouz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CellView : UIButton

@property (nonatomic, retain) UIImageView * imageView;

@property (nonatomic, retain) UILabel * captionLabel;
@property (nonatomic, retain) UIButton * btnDelete;

@property (nonatomic, retain) UIView * mainView;
@property (nonatomic, retain) UIView * highlightView;
-(IBAction)test:(id)sender;

-(IBAction)highlight:(id)sender;
-(IBAction)unHighlight:(id)sender;

@end
