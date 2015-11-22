//
//  main.c
//  PA1
//
//  Created by Toan Tran on 1/17/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import <stdio.h>
#import <Foundation/Foundation.h>
#import "Demo.h"

int main(int argc, const char * argv[])
{

    char* name = "Toan Tran";
    printf("1. printf my name: %s\n", name);
    NSLog(@"2. NSLog my name: %s\n",name);
    
    NSObject* nsObject1 = [[NSObject alloc] init];
    NSLog(@"3. NSLog of NSObject: %@\n",nsObject1);
    
    NSString* nsString = [[NSString alloc] initWithUTF8String:name];
    NSLog(@"4. NSLog of NSString: %@\n", nsString);
    
    NSDate* nsDate = [[NSDate alloc] init];
    NSLog(@"5. NSLog of NSDate: %@\n", nsDate);
    
    NSNumber* nsNumber = [[NSNumber alloc] initWithInt:13];
    NSLog(@"6. NSLog of NSNumber: %@\n", nsNumber);
    
    Demo* demo = [[Demo alloc] init];
    NSLog(@"7. NSLog of Demo object: %@\n", demo);
    
    return 0;
}

