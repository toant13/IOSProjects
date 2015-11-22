//
//  BandStudent.h
//  PA3
//
//  Created by Toan Tran on 2/4/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "Student.h"

@interface BandStudent : Student

@property NSString *instrument;
-(id)initWithName:(NSString*) name andNumber:(int)number andDate:(NSDate*)date andInstrument:(NSString *)inst;


@end
