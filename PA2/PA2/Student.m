//
//  Student.m
//  PA2
//
//  Created by Toan Tran on 1/24/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "Student.h"

@implementation Student

-(NSString *)description
{
    return [[NSString alloc] initWithFormat:@"number: %i, name: %@, startDate: %@\n", self.number, self.name, self.startDate];
}


@end
