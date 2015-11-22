//
//  ServiceAdvisor.m
//  PA4
//
//  Created by Toan Tran on 2/7/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "ServiceAdvisor.h"

@implementation ServiceAdvisor
-(void)doTest
{
    NSLog(@"Notify customer, service is complete: %s", __PRETTY_FUNCTION__);
    [self.delegate serviceComplete:self];
}
@end
