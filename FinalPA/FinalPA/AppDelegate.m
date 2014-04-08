//
//  AppDelegate.m
//  FinalPA
//
//  Created by Toan Tran on 3/13/14.
//  Copyright (c) 2014 Toan Tran. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate() <CLLocationManagerDelegate, NSURLConnectionDataDelegate>

@end
@implementation AppDelegate
{
    int count;
    CLLocationManager *locationManager;
    NSMutableString *msCnt;
    NSMutableString *msLoc;
    NSMutableString *msJson;
    UITextView *textViewCount;
    UITextView *textViewLocation;
    UITextView *textViewJson;
    NSData *dataJson;
}
//Button constants
NSString *const BUTTON1TITLE = @"Site JSON";
NSString *const BUTTON1ALTTITLE = @"Parse JSON";
NSString *const BUTTON2TITLE = @"Show Loc";
NSString *const BUTTON2ALTTITLE = @"Hide Loc";
NSString *const BUTTON3TITLE = @"Reset Count";


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSLog(@"Toan Tran \nFinalPA");
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self setupLocationManager];
    
    
    
    /*********Instantiate textViews *****************/
    textViewCount = [self setupTextView:[UIColor whiteColor] y:100 height:50];
    textViewJson = [self setupTextView:[UIColor greenColor] y:200 height:120];
    textViewLocation = [self setupTextView:[UIColor redColor] y:320 height:60];
    [self.window addSubview:textViewCount];
    [self.window addSubview:textViewJson];
    [self.window addSubview:textViewLocation];
    /*******************************************************************/
    
    
    /*********Instantiate buttons and assign selectors *****************/
    UIButton *siteButton = [self createButton:[UIColor greenColor] title:BUTTON1TITLE x:40 y:30 width:100.0 height:40.0];
    UIButton *locationButton = [self createButton:[UIColor redColor] title:BUTTON2TITLE x:180 y:30 width:100.0 height:40.0];
    UIButton *rstCntButton = [self createButton:[UIColor blueColor] title:BUTTON3TITLE x:85 y:410 width:150.0 height:40.0];
    [siteButton addTarget:self action:@selector(getSiteSource:) forControlEvents:UIControlEventTouchUpInside];
    [locationButton addTarget:self action:@selector(locationTasks:) forControlEvents:UIControlEventTouchUpInside];
    [rstCntButton addTarget:self action:@selector(resetCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:siteButton];
    [self.window addSubview:locationButton];
    [self.window addSubview:rstCntButton];
    /*******************************************************************/
    
    /************Instantiate Mutable Strings***************************/
    msCnt = [[NSMutableString alloc] initWithFormat:@"%i",count];
    [textViewCount setFont:[UIFont boldSystemFontOfSize:40]];
    textViewCount.textAlignment = NSTextAlignmentCenter;
    textViewCount.text = msCnt;
    msLoc = [[NSMutableString alloc] initWithString:@"--Tap red button to show current location--"];
    textViewLocation.text = msLoc;
    textViewLocation.textAlignment = NSTextAlignmentCenter;
    msJson = [[NSMutableString alloc] initWithString:@"--Tap green button to get date Json from: http://date.jsontest.com/--"];
    textViewJson.text = msJson;
    /*******************************************************************/
    
    [self setupCounterQueue];
    
    return YES;
}

/**
 * Method name: resetCount
 * Description: Resets the count
 * Parameters: button executed to start method
 */
-(void)resetCount:(id)Button
{
    NSLog(@"Reset count");
    count = 0;
}

/**
 * Method name: setupCounterQueue
 * Description: Sets up the NSOperationQueue to start counter task
 * Parameters: none
 */
-(void)setupCounterQueue
{
    NSOperationQueue*  queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(startCounter) object:nil];
    [queue addOperation:op];
}

/**
 * Method name: startcounter
 * Description: Starts counter for app
 * Parameters: none
 */
-(void)startCounter
{
    @autoreleasepool
    {
        while (YES)
        {
            sleep(1);
            count++;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                textViewCount.text = [NSString stringWithFormat:@"%i",
                                      count];
            }];
        }
    }
    
}

/**
 * Method name: setupTextView
 * Description: Creates instances of UITextViews
 * Parameters: color: color of UITextView, y: y-coordinate of view, height: height of view
 */
- (UITextView*) setupTextView:(UIColor*) color y:(CGFloat)y height:(CGFloat)height
{
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    rect.origin.y = y;
    rect.size.height = height;
    UITextView *textView = [[UITextView alloc] initWithFrame:rect];
    textView.backgroundColor = color;
    textView.editable = NO;
    return textView;
}

/**
 * Method name: createButton
 * Description: creates instances of UIButtons
 * Parameters: color: color of button, title: title of button, x: x-coordinate of buttony: y-coordinate of view, width: width of button, height: height of view
 
 */
- (UIButton*) createButton:(UIColor*) color title:(NSString*) title x:(CGFloat)x y:(CGFloat)y width:(CGFloat) width height:(CGFloat) height
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = CGRectMake(x, y, width, height);
    return button;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    dataJson = data;
    NSString* siteJson = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [msJson setString:[NSString stringWithFormat:@"Tap green button again to parse json:\n%@",siteJson]];
    textViewJson.text = msJson;
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [msJson setString:[error localizedDescription]];
    textViewJson.text = msJson;
}



/**
 * Method name: getSiteSource
 * Description: Gets content from url given
 * Parameters: button: button
 */
-(void)getSiteSource:(id)button
{
    
    if([[button currentTitle] isEqualToString:BUTTON1TITLE])
    {
        [button setTitle:BUTTON1ALTTITLE forState:UIControlStateNormal];
        NSString *urlString = @"http://date.jsontest.com/";
        
        NSURL *myURL = [NSURL URLWithString:urlString];
        
        NSURLRequest *myRequest = [NSURLRequest requestWithURL:myURL];
        
        
        [NSURLConnection connectionWithRequest:myRequest delegate:self];
        
        
    }
    else
    {
        NSLog(@"change button state");
        [self parseSiteJson];
        [button setTitle:BUTTON1TITLE forState:UIControlStateNormal];
    }
}

/**
 * Method name: parseSiteJson
 * Description: parses JSON from the content given from site
 * Parameters: none
 */
-(void)parseSiteJson
{
    NSError *myError = nil;
    NSDictionary *jsonDictionary =[NSJSONSerialization JSONObjectWithData:dataJson options:0 error:&myError];
    if (myError) {
        [msJson setString:[NSString stringWithFormat:@"Error occured: %@", [myError localizedDescription]]];
        NSLog(@"json Error: %@", [myError localizedDescription]);
    }
    else {
        [msJson setString:[NSString stringWithFormat:@"Parsed JSON:\n\n   Time Element: %@\n   millisec since Unix epoch: %@ms\n   Date is: %@", [jsonDictionary objectForKey:@"time"],[jsonDictionary objectForKey:@"milliseconds_since_epoch"],[jsonDictionary objectForKey:@"date"]]];
        textViewJson.text = msJson;
        NSLog(@"Time: %@", [jsonDictionary objectForKey:@"time"]);
    }
    
}

/**
 * Method name: locationTasks
 * Description: Handles state of location button
 * Parameters: button: button
 */
-(void)locationTasks:(id)button
{
    if([[button currentTitle] isEqualToString:BUTTON2TITLE])
    {
        [locationManager startUpdatingLocation];
        [button setTitle:BUTTON2ALTTITLE forState:UIControlStateNormal];
    }
    else
    {
        NSLog(@"change button state");
        [button setTitle:BUTTON2TITLE forState:UIControlStateNormal];
        [locationManager stopUpdatingLocation];
        textViewLocation.text = @"--Location Hidden--";
    }
}

/**
 * Method name: setupLocationManager
 * Description: setups all necessary componenets to get location parameters
 * Parameters: none
 */
-(void)setupLocationManager
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.delegate = self;
}


-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations[0];
    [msLoc setString:[NSString stringWithFormat:@"--Location (Click button again to hide)-- \nLatitude: %f\nLongitude: %f",location.coordinate.latitude,location.coordinate.longitude]];
    textViewLocation.text = msLoc;
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
