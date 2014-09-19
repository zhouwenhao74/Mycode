//
//  AppRoundModel.m
//  爱限免V5
//
//  Created by Alex on 14-5-26.
//  Copyright (c) 2014年 Alex.Chou. All rights reserved.
//

#import "AppRoundModel.h"

@implementation AppRoundModel
-(void)dealloc
{
    self.imageUrlArrayR = nil;
    self.labelArrayR = nil;
    [super dealloc];
}

-(id)initWithDictionary:(NSDictionary*)dictionary;
{
    self = [super init];
    if (self != nil)
    {
       
        NSArray *array = dictionary[@"applications"];
        NSMutableArray *labelArrayR = [[NSMutableArray alloc] init];
        NSMutableArray *imageUrlArrayR = [[NSMutableArray alloc] init];
        for(int i = 0; i < array.count;i++)
        {
            [imageUrlArrayR addObject:array[i][@"iconUrl"]];
            [labelArrayR addObject:array[i][@"name"]];
        }
        self.imageUrlArrayR = imageUrlArrayR;
        self.labelArrayR = labelArrayR;
        [imageUrlArrayR release];
        [labelArrayR release];
        
    }
    return self;
    
}
@end
