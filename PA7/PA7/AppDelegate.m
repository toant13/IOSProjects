//
//  AppDelegate.m
//  PA7
//
//  Created by Toan Tran on 3/1/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    int buttonHitCount;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"count = 0" forState:UIControlStateNormal];
    [self.window addSubview:button];
    
    
    [button addTarget:self action:@selector(doButtonTask:) forControlEvents:UIControlEventTouchUpInside];

    return YES;
}

-(void)doButtonTask:(id)button
{
    buttonHitCount++;

    switch(buttonHitCount)
    {
        case 1:
        {
            NSLog(@"first time increment");
            [self doButtonCount:button];
            break;
        }
        case 2:
        {
            NSLog(@"second time increment");
            [self performSelectorInBackground:@selector(doSecondIncrementMethod:) withObject:button];
            break;
        }
        case 3:
        {
            NSLog(@"third time increment");
            [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(doThirdIncrementMethod:) userInfo:button repeats:YES];
            break;
        }
        case 4:
        {
            NSLog(@"fourth time increment");
            NSOperationQueue*  queue = [[NSOperationQueue alloc] init];
            NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(doFourthIncrementMethod:) object:button];
            [queue addOperation:op];
            break;
        }
        case 5:
        {
            NSLog(@"fifth time increment");
            [self doFifthIncrementMethod:button];
            break;
        }
    }
}

/*
 * Increments button count
 */
-(void)doButtonCount:(id)button
{
    static int count;
    count++;
    NSString *s = [NSString stringWithFormat:@"count: %i",count];
    [button setTitle:s forState:UIControlStateNormal];
}

/*
 * increment the count every 1 second, using performSelectorInBackground:withObject:
 */
-(void)doSecondIncrementMethod:(id)button
{
    while(buttonHitCount == 2)
    {
        sleep(1);
        [self performSelectorOnMainThread:@selector(doButtonCount:) withObject:button waitUntilDone:YES];
    }
}

/*
 * increment the count every 1 second, using NSTimer:
 */
-(void)doThirdIncrementMethod:(NSTimer*) timer
{
    if(buttonHitCount == 3)
    {
        UIButton *b = [timer userInfo];
        [self doButtonCount:b];
    }
    else
    {
        [timer invalidate];
        timer = nil;
    }
}

/*
 * increment the count every 1 second, using NSOperationQueue:
 */
-(void)doFourthIncrementMethod:(id)button
{
    while(buttonHitCount == 4)
    {
        sleep(1);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{[self doButtonCount:button];}];
    }
}

/*
 * increment the count every 1 second, using GCD - Grand Central Dispatch
 */
-(void)doFifthIncrementMethod:(id)button
{
    dispatch_queue_t q = dispatch_queue_create("com.pa.seven", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(q, ^{
        while(buttonHitCount == 5)
        {
            sleep(1);
            dispatch_async(dispatch_get_main_queue(),^{
                [self doButtonCount:button];
            });
        }
    });
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
