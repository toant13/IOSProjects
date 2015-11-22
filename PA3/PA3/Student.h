//
//  Student.h
//  PA3
//
//  Created by Toan Tran on 2/4/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject


@property NSString* name;
@property int number;
@property NSDate* date;

-(id)initWithName:(NSString*) name;
-(id)initWithName:(NSString*) name andNumber:(int)number;
-(id)initWithName:(NSString*) name andNumber:(int)number andDate:(NSDate*)date;

@end
