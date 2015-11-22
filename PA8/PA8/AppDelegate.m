//
//  AppDelegate.m
//  PA8
//
//  Created by Toan Tran on 3/2/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>


@interface AppDelegate() <CLLocationManagerDelegate>
@end

@implementation AppDelegate
{
    int count;
    CLLocationManager *locationManager;
    NSMutableString *msTop;
    NSMutableString *msBottom;
    UITextView *textViewTop;
    UITextView *textViewBottom;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
   
    
    
   
    rect.size.height = [[UIScreen mainScreen] applicationFrame].size.height * .5;
    
    
    textViewTop = [[UITextView alloc] initWithFrame:rect];
    textViewTop.backgroundColor = [UIColor lightGrayColor];
    msTop = [[NSMutableString alloc] init];
    [self.window addSubview:textViewTop];
    textViewTop.editable = NO;
    
    rect.origin.y = (rect.origin.y) + ([[UIScreen mainScreen] applicationFrame].size.height * .5);
    textViewBottom = [[UITextView alloc] initWithFrame:rect];
    textViewBottom.backgroundColor = [UIColor greenColor];
    msBottom = [[NSMutableString alloc] init];
    [self.window addSubview:textViewBottom];
    textViewBottom.editable = NO;
    
    [msBottom setString:@"testing setting shit"];
    textViewBottom.text = msBottom;
    
    return YES;
}



-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations
{
    count++;
    CLLocation *location = locations[0];
    NSLog(@"%i %f-%f", count, location.coordinate.latitude,
          location.coordinate.longitude);
    [msTop setString:[NSString stringWithFormat:@"Count: %i\nLatitude: %f\nLongitude: %f", count, location.coordinate.latitude,location.coordinate.longitude]];
    textViewTop.text = msTop;
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