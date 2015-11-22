//
//  main.m
//  PA4
//
//  Created by Toan Tran on 2/7/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceAdvisor.h"
#import "ServiceCustomer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"This program by Toan Tran");
        
        /* (1) creates a ServiceCustomer */
        ServiceCustomer* serviceCustomer = [[ServiceCustomer alloc] init];
        
        /*(2) creates a ServiceAdvisor*/
        ServiceAdvisor* serviceAdvisor = [[ServiceAdvisor alloc] init];
        
        /*(3) sets the delegate of the ServiceAdvisor to the ServiceCustomer*/
        serviceAdvisor.delegate = serviceCustomer;
        
        /*doTest method that you can call on the ServiceAdvisor, and it notifies the ServiceCustomer when the service is complete.*/
        [serviceAdvisor doTest];
        
       
        
    }
    return 0;
}

