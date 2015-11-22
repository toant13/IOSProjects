//
//  main.m
//  PA3
//
//  Created by Toan Tran on 2/4/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BandStudent.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        NSLog(@"This program by Tony Tran");
        
        NSDate *date1 = [NSDate date];
        NSString *dateStr =[NSDateFormatter localizedStringFromDate:date1 dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
        NSLog(@"Short Formed Date: %@", dateStr);
        
        BandStudent *bandStudent1 = [[BandStudent alloc]initWithName:@"John" andNumber:123 andDate:date1 andInstrument:@"trumpet"];
        
        BandStudent *bandStudent2 = [[BandStudent alloc]initWithName:@"Sally" andNumber:456 andDate:date1 andInstrument:@"trombone"];
        
        //Create Mutable Array and add band students to array
        NSMutableArray* mutableArray = [[NSMutableArray alloc]init];
        [mutableArray addObject:bandStudent1];
        [mutableArray addObject:bandStudent2];
        
        //Alternative method can also be done during intialization as seen in line below
        //NSMutableArray* mutableArray = [[NSMutableArray alloc] initWithObjects:bandStudent1, bandStudent2, nil];
        
        //1. using -description;
        NSLog(@"Print Array way 1:%@", mutableArray);
        
        //2. using a for(int i = 0; i < [array count]; i++)
        NSLog(@"Print Array way 2: \n:");
        for(int i = 0; i < [mutableArray count]; i++)
        {
            NSLog(@"%@",[mutableArray objectAtIndex:i]);
        }
        
        //3. using for (Student *s in array).
        NSLog(@"Print Array way 3: \n:");
        for(BandStudent *s in mutableArray)
        {
            NSLog(@"%@",s);
        }
        
    }
    return 0;
}

