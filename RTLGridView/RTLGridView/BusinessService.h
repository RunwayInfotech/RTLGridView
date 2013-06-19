//
//  BusinessService.h
//  BizAppTutorial
//
//  Created by Tope on 03/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessService : NSObject

@property (nonatomic, copy) NSString* caption;

@property (nonatomic, retain) UIImage* image;
 
-(id)initWithCaption:(NSString*)theCaption andImage:(UIImage*)theImage;

+(NSArray*)getSampleData;

@end
