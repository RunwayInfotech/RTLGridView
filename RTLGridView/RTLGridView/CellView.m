//
//  FavoritesCellView.m
//  MyAQGridView
//
//  Created by Moayad Al kouz on 6/18/13.
//  Copyright (c) 2013 Moayad Al kouz. All rights reserved.
//

#import "CellView.h"
#import <QuartzCore/QuartzCore.h>
@implementation CellView
@synthesize imageView, captionLabel,btnDelete,highlightView ;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setAdjustsImageWhenHighlighted:YES];
        [self setShowsTouchWhenHighlighted:YES];
        
        float CELL_WIDTH = frame.size.width;
        float CELL_HEIGHT = frame.size.height;
        NSLog(@"CELL_HEIGHT : %f", CELL_HEIGHT);
        UIView* mainView = [[UIView alloc] initWithFrame:frame];
        [mainView setBackgroundColor:[UIColor clearColor]];
        [mainView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        UIImageView *frameImageView = [[UIImageView alloc] initWithFrame:CGRectMake(9, 4, CELL_WIDTH-18, CELL_HEIGHT-8)];
        [frameImageView setImage:[UIImage imageNamed:@"tab-mask.png"]];
        
        CGRect innerRect = frameImageView.frame;
        innerRect.origin.x -= 8;
         innerRect.origin.y -= 3;
         innerRect.size.width += 16;
        innerRect.size.height += 6;
        //CGRectMake(0,0,self.frame.size.width-2,self.frame.size.height-2);
        highlightView = [[UIView alloc] initWithFrame:innerRect];
        highlightView.backgroundColor = [UIColor clearColor];
        highlightView.layer.masksToBounds = NO;
        highlightView.layer.cornerRadius = 8; // if you like rounded corners
        highlightView.layer.shadowRadius = 5;
        highlightView.layer.shadowOpacity = 0.5;
        highlightView.layer.shadowPath = [UIBezierPath bezierPathWithRect:highlightView.bounds].CGPath;
        [highlightView setUserInteractionEnabled:NO];
        [highlightView setHidden:YES];
        [self addSubview:highlightView];
        
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(13, 8, CELL_WIDTH-25, CELL_HEIGHT-25)];
        
        self.captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, CELL_HEIGHT-50, CELL_WIDTH-25, 21)];
        [captionLabel setFont:[UIFont systemFontOfSize:14]];
        
        [mainView addSubview:imageView];
        [mainView addSubview:frameImageView];
        [mainView addSubview:captionLabel];
        
        [self addSubview:mainView];
        self.btnDelete = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnDelete.frame = CGRectMake(0, 0, 30, 40);
        [self.btnDelete setHidden:YES];
        [self.btnDelete setImage:[UIImage imageNamed:@"close-6.png"] forState:UIControlStateNormal];
        [self addSubview:self.btnDelete];
        [mainView setUserInteractionEnabled:NO];
        
        
        [self addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        //[self setBackgroundImage:[UIImage imageNamed:@"tab-mask.png"] forState: UIControlStateHighlighted ];
        //[self addTarget:self action:@selector(highlight:) forControlEvents:UIControlEventTouchDown];
        
        //[self addTarget:self action:@selector(unHighlight:) forControlEvents:UIControlEventTouchCancel];
        
    }
    return self;
}

-(IBAction)highlight:(id)sender{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 2;
    self.layer.shadowOffset = CGSizeMake(6.0f,6.0f);
    //[highlightView setHidden:NO];
    //[self setBackgroundColor:[UIColor colorWithPatternImage:img]];
}

-(IBAction)unHighlight:(id)sender{
    self.layer.shadowColor = [UIColor clearColor].CGColor;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 2;
    self.layer.shadowOffset = CGSizeMake(6.0f,6.0f);
    //[highlightView setHidden:YES];
}

-(IBAction)test:(id)sender
{
    NSLog(@"test");
   [highlightView setHidden:YES];
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [highlightView setHidden:NO];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [highlightView setHidden:YES];
    [super touchesEnded:touches withEvent:event];
    
}


@end
