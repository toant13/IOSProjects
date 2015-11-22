//
//  BandStudent.m
//  PA3
//
//  Created by Toan Tran on 2/4/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "BandStudent.h"

@implementation BandStudent

-(id)initWithName:(NSString*) name andNumber:(int)number andDate:(NSDate*)date andInstrument:(NSString *)inst
{
    self = [self initWithName:name andNumber:number andDate:date];
    if (self) {
        self.instrument = inst;
    }
    return self;
}

-(NSString *)description
{
    return [NSString
            stringWithFormat:@"%@, instrument: %@",
            [super description],
            self.instrument];
    
}

@end
