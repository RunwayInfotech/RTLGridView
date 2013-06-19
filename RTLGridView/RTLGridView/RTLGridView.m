//
//  FavoritesGridView.m
//  MyAQGridView
//
//  Created by Moayad Al kouz on 6/18/13.
//  Copyright (c) 2013 Moayad Al kouz. All rights reserved.
//

#import "RTLGridView.h"
#import "BusinessService.h"
#import "CellView.h"
@implementation RTLGridView

-(id) initWithFrame:(CGRect)frame andItems:(NSArray *) array 
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        cellWidth = 160;
        cellHeight = 223;
        cellSpacing = 5;
        numOfCols = 1;
        isZigzag = NO;
        self.services = [[NSMutableArray alloc] initWithArray:array];
        //[self initItems];
    }
    return self;
}

-(void) setZigzagGrid:(BOOL) z{
    isZigzag = z;
    [self reloadData];
}

-(void) setCellHeight:(int)height{
    cellHeight = height;
    [self reloadData];
}

-(void) setCellWidth:(int)width{
    cellWidth = width;
    [self reloadData];

}
-(void) setCellSpacing:(int) space{
    cellSpacing = space;
    [self reloadData];

}

-(void) setNumOfItemPerRow:(int)cols{
    numOfCols = cols;
    [self layoutItems];
}

-(void) computeContentSize{
   
    int height = self.bounds.size.height;
    int width = self.bounds.size.width;
    
    width = numOfCols * (cellWidth + (cellSpacing*2));
    
     numOfRows = self.services.count / numOfCols;
    if (self.services.count % numOfCols != 0) {
        numOfRows ++;
    }
    height = (numOfRows * cellHeight) + (numOfRows * cellSpacing) ;

    if (width < self.bounds.size.width) {
        width = self.bounds.size.width;
    }else{
        width += 2*cellSpacing;
    }
    
    if ((height ) < self.bounds.size.height) {
        height = self.bounds.size.height;
    }else{
        height +=  (numOfRows * cellSpacing);
    }
    self.contentSize = CGSizeMake(width , height);
    
}

-(void) layoutItems{
    
    
    
    [self computeContentSize];
    
    int itemsWidth = (numOfCols  * cellWidth) + ((numOfCols-1) * 2 * cellSpacing);
    //int itemsHeight = (numOfRows * cellHeight) + ((numOfRows) * 2 * cellSpacing);
    
    int start = ((self.contentSize.width-itemsWidth)/2) - (cellSpacing*2);
    int y = (2 * cellSpacing);//((self.contentSize.height-itemsHeight)/2) - (cellSpacing*2);
    if (isZigzag) {
        /*for (int x=1; x<=self.services.count; x++) {
            UIView * vv = [self viewWithTag:500+x-1];
            switch (x % numOfRows) {
                case 0:
                    
                    break;
                    
                default:
                    break;
            }
            
            start+= (cellWidth + (cellSpacing*2));
            
            vv.frame = CGRectMake(self.contentSize.width - start , y, cellWidth,cellHeight) ;
            if (x % numOfCols == 0) {
                y += cellHeight + (2 * cellSpacing);
                start = ((self.contentSize.width-itemsWidth)/2) - (cellSpacing*2);
            }
        }*/
    }else{
        for (int x=1; x<=self.services.count; x++) {
            UIView * vv = [self viewWithTag:500+x-1];
            
            start+= (cellWidth + (cellSpacing*2));
            
            vv.frame = CGRectMake(self.contentSize.width - start , y, cellWidth,cellHeight) ;
            if (x % numOfCols == 0) {
                y += cellHeight + (2 * cellSpacing);
                start = ((self.contentSize.width-itemsWidth)/2) - (cellSpacing*2);
            }
        }
    }
    [self setContentOffset:CGPointMake(self.contentSize.width - self.bounds.size.width, 0)];
}

-(void) initItems{
   
    float offset = 0 ;
    for (int index=0; index<self.services.count; index++) {
        BusinessService * service = [self.services objectAtIndex:index];
        
       
         CellView * cell = [[CellView alloc] initWithFrame: CGRectMake(0, 0.0, cellWidth,cellHeight) ];
        cell.tag = 500+index;
        offset += cellWidth ;
        [cell.imageView setImage:service.image];
        [cell.captionLabel setText:service.caption];
        [self addSubview:cell];
       
    }
    [self layoutItems];
    
}


-(void) setLayout:(FGridViewLayoutDirection) layout{
    gridLayout = layout;
    
    [self reloadData];
}


-(void) reloadData{
    for (UIView * tmp in self.subviews) {
        [tmp removeFromSuperview];
    }
    
    
    [self initItems];
    
    
    int cols = 0;
    int width = 0;
    int rows = 0;
    int height = 0;
    
    switch (gridLayout) {
        case FGridViewLayoutDirectionVertical:
        default:
            
            while(width+(cellWidth + (cellSpacing*2)) < self.frame.size.width){
                width += (cellWidth + (cellSpacing*2));
                cols ++;
            }
            
            numOfCols = cols;
            break;
            
        case FGridViewLayoutDirectionHorizontal:
            while(height + (cellHeight + (2 * cellSpacing)) < self.frame.size.height){
                height += cellHeight + (2 * cellSpacing);
                rows ++;
            }
            cols = self.services.count / rows;
            if (self.services.count % rows != 0) {
                cols ++;
            }
            numOfRows = rows;
            numOfCols = cols;
            break;
    }
    [self computeContentSize];
    [self layoutItems];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
