//
//  Student.m
//  PA3
//
//  Created by Toan Tran on 2/4/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "Student.h"

@implementation Student

-(NSString *)description
{
    return [[NSString alloc] initWithFormat:@"super description: %@, name: %@, number: %i, date: %@\n",[super description], self.name, self.number, self.date];
}

-(id)initWithName:(NSString*) name
{
    return [self initWithName:name andNumber:0];
}

-(id)initWithName:(NSString*) name andNumber:(int)number
{
    return [self initWithName:name andNumber:number andDate:nil];
}

-(id)initWithName:(NSString*) name andNumber:(int)number andDate:(NSDate*)date
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.number = number;
        self.date = date;
        
    }
    return self;
}

@end
