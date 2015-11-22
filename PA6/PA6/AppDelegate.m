//
//  AppDelegate.m
//  PA6
//
//  Created by Toan Tran on 2/16/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    NSMutableString *ms;
    UITextView *textView;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    CGRect rect = self.window.bounds;
    rect.origin.y = 20;
    textView = [[UITextView alloc] initWithFrame:rect];
    ms = [[NSMutableString alloc] init];
    [self.window addSubview:textView];
    textView.editable = NO;
    [ms appendString:@"Tony Tran\nPA6\nLoading: http://developer.apple.com\n\n"];
    textView.text = ms;
    
    NSString *urlString = @"http://developer.apple.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
    
    return YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [ms appendString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
    textView.text = ms;
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [ms appendString:[error localizedDescription]];
    textView.text = ms;
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
