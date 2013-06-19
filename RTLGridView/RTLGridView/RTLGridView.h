//
//  FavoritesGridView.h
//  MyAQGridView
//
//  Created by Moayad Al kouz on 6/18/13.
//  Copyright (c) 2013 Moayad Al kouz. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
	FGridViewLayoutDirectionVertical,
	FGridViewLayoutDirectionHorizontal
} FGridViewLayoutDirection;

@class CellView;


@interface RTLGridView : UIScrollView
{
    FGridViewLayoutDirection gridLayout;
    
    int numOfCols;
    int numOfRows;
    int cellWidth;
    int cellHeight;
    int cellSpacing;
    BOOL isZigzag;
}

-(void) initItems;
-(id) initWithFrame:(CGRect)frame andItems:(NSArray *) array;
@property (nonatomic, retain) NSMutableArray * services;
/*@property (nonatomic) int numOfCols;
@property (nonatomic) int numOfRows;
@property (nonatomic) int cellWidth;
@property (nonatomic) int cellHeight;
@property (nonatomic) int cellSpacing;
*/
-(void) setNumOfItemPerRow:(int)cols;
-(void) setLayout:(FGridViewLayoutDirection) layout;
-(void) layoutItems;
-(void) reloadData;

-(void) setCellHeight:(int)height;
-(void) setCellWidth:(int)width;
-(void) setCellSpacing:(int) space;
@end
