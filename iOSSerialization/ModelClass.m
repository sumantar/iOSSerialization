//
//  ModelClass.m
//  iOSSerialization
//
//  Created by sumantar on 26/02/13.
//  Copyright (c) 2013 sumantar. All rights reserved.
//

#import "ModelClass.h"
#define     NAME        @"name"
#define     ADDRESS     @"address"

@implementation ModelClass

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)coder {
    self = [super init]; 
    if (self){
        self.name = [coder decodeObjectForKey:NAME];
        self.address = [coder decodeObjectForKey:ADDRESS];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.address forKey:ADDRESS];
    [aCoder encodeObject:self.name forKey:NAME];
}
@end
