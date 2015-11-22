//
//  ServiceAdvisor.h
//  PA4
//
//  Created by Toan Tran on 2/7/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ServiceAdvisor;
@protocol ServiceAdvisorDelegate <NSObject>
-(void)serviceComplete:(ServiceAdvisor *)s;
@end

@interface ServiceAdvisor : NSObject
@property id<ServiceAdvisorDelegate> delegate;
-(void)doTest;
@end
