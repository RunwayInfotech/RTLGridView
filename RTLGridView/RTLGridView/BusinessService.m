//
//  BusinessService.m
//  BizAppTutorial
//
//  Created by Tope on 03/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BusinessService.h"

@implementation BusinessService


@synthesize caption, image;

-(id)initWithCaption:(NSString*)theCaption andImage:(UIImage*)theImage
{
    self = [super init];
    
    if(self)
    {
        self.caption = theCaption;
        self.image = theImage;
    }
    
    return self;
}

+(NSArray*)getSampleData
{
    
    BusinessService* service1 = [[BusinessService alloc] initWithCaption:@"0 Litigation" andImage:[UIImage imageNamed:@"service-1.jpg"]];
    
    BusinessService* service2 = [[BusinessService alloc] initWithCaption:@"1 Family Law" andImage:[UIImage imageNamed:@"service-2.jpg"]];
    
    BusinessService* service3 = [[BusinessService alloc] initWithCaption:@"2 Conveyancing" andImage:[UIImage imageNamed:@"service-3.jpg"]];
    
    
    BusinessService* service4 = [[BusinessService alloc] initWithCaption:@"3 Corporate Law" andImage:[UIImage imageNamed:@"service-4.jpg"]];
    
    
    BusinessService* service5 = [[BusinessService alloc] initWithCaption:@"4 Solicitors" andImage:[UIImage imageNamed:@"service-5.jpg"]];
    
    
    BusinessService* service6 = [[BusinessService alloc] initWithCaption:@"5 Tax Law" andImage:[UIImage imageNamed:@"service-6.jpg"]];
    
    return [NSArray arrayWithObjects:service1, service2,service3,service4,service5,service6,service1, service2,service3,service4,service5,service6,service1, service2,service3,service4,service5,service6,service1, service2,service3,service4,service5,service6,service1, service2,service3,service4,service5,service6,service1, service2,service3,service4,service5,service6,service1, service2,service3,service4,service5,service6,nil];
}

@end
