//
//  main.m
//  PA2
//
//  Created by Toan Tran on 1/24/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Name: Toan Tran");
        
        NSDate* date = [[NSDate alloc] init];
        NSLog(@"Date: %@", date);
        
        Student* johnDoe = [[Student alloc] init];
        Student* sallySmith = [[Student alloc] init];
        
        johnDoe.number = 123;
        sallySmith.number = 456;
        
        johnDoe.name = @"John Doe";
        sallySmith.name = @"Sally Smith";
        
        johnDoe.startDate = [[NSDate alloc] init];
        sleep(10);
        sallySmith.startDate = [[NSDate alloc] init];
        
        NSLog(@"%@ \n, %@ ", johnDoe, sallySmith);
        
    }
    return 0;
}

