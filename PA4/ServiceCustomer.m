//
//  ServiceCustomer.m
//  PA4
//
//  Created by Toan Tran on 2/7/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "ServiceCustomer.h"

@implementation ServiceCustomer
-(void)serviceComplete:(ServiceAdvisor *)s
{
    NSLog(@"Just been notified service is complete: %s", __PRETTY_FUNCTION__);
}


@end
