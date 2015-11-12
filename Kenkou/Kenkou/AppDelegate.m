//
//  AppDelegate.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 10/17/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "AppDelegate.h"
#import "OnboardingViewController.h"
#import "OnboardingContentViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:1.0f green:0.44313725f blue:0.37647059f alpha:1]];
    //[[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0.10196078f green:0.10196078f blue:0.10196078f alpha:1]];
    
    [self setStoryboard];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - App initialization methods

// Chooses and displays the correct storyboard
- (void)setStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    [self setInitialScreen:storyboard];
}

// Sets the initial screen for the chosen storyboard
- (void)setInitialScreen:(UIStoryboard *)storyboard
{
    UIViewController *initViewController;
    
    if (
        // Is this the first time the user has opened the application?
        [self isUserNew]
        )
    {
        initViewController = [self generateOnboardingViewControllerWithStoryboard:storyboard];
    }
    else
    {
        initViewController = [storyboard instantiateViewControllerWithIdentifier: @"Main"];
    }
    
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen] bounds]];
    self.window.rootViewController = initViewController;
    [self.window makeKeyAndVisible];
}

// Verifies if it is the first time the user has opened the application
- (BOOL)isUserNew
{
    NSString *pathList = [[NSBundle mainBundle] pathForResource:@"AppConfigurationFile" ofType:@"plist"];
    NSDictionary *nsDictionaryAppConfigurations = [[NSDictionary alloc] initWithContentsOfFile:pathList];
    
    BOOL boolIsUserNew = [[nsDictionaryAppConfigurations valueForKey:@"IsUserNew"] boolValue];
    return boolIsUserNew;
}

#pragma mark - Onboarding methods

// Generates the onboarding ViewController
- (OnboardingViewController *)generateOnboardingViewControllerWithStoryboard:(UIStoryboard *)storyboard
{
    OnboardingContentViewController *onboardingContentViewControllerFirstPage = [OnboardingContentViewController
    contentWithTitle:@"Registra"
    body:@"Registra diariamente tus datos dentro de cuatro categorías: Alimentación, Ejercicio, Sueño y Alcohol"
    image:nil
    buttonText:nil
    action:nil];
    
    OnboardingContentViewController *onboardingContentViewControllerSecondPage = [OnboardingContentViewController
    contentWithTitle:@"Observa"
    body:@"Observa tu estado actual dentro de las cuatro categorías"
    image:nil
    buttonText:nil
    action:nil];
    
    OnboardingContentViewController *onboardingContentViewControllerThirdPage = [OnboardingContentViewController
    contentWithTitle:@"Analiza"
    body:@"Analiza tu progreso a través del tiempo de diferentes maneras"
    image:nil
    buttonText:@"Continuar"
    action:^{[self handleOnboardingCompletionWithStoryboard:storyboard];}];
    
    OnboardingViewController *onboardingViewController = [OnboardingViewController
    onboardWithBackgroundImage:[UIImage imageNamed:@"OnboardingBackground"]
    contents:@[onboardingContentViewControllerFirstPage,
               onboardingContentViewControllerSecondPage,
               onboardingContentViewControllerThirdPage]];
    
    // Onboarding ViewController customization
    onboardingViewController.shouldFadeTransitions = YES;
    onboardingViewController.fadePageControlOnLastPage = YES;
    onboardingViewController.fadeSkipButtonOnLastPage = YES;
    onboardingViewController.shouldMaskBackground = NO;
    onboardingViewController.shouldBlurBackground = YES;
    onboardingViewController.titleFontSize = 50;
    onboardingViewController.underTitlePadding = 40;
    onboardingViewController.titleFontName = @"AppleSDGothicNeo-Bold";
    
    return onboardingViewController;
}

- (void)setMainViewControllerAsRootViewControllerWithStoryboard:(UIStoryboard *)storyboard
{
    // create whatever your root view controller is going to be, in this case just a simple view controller
    // wrapped in a navigation controller
    
    self.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier: @"Main"];
}

- (void)handleOnboardingCompletionWithStoryboard:(UIStoryboard *)storyboard
{
    // set that we have completed onboarding so we only do it once... for demo
    // purposes we don't want to have to set this every time so I'll just leave
    // this here...
    
    // transition to the main application
    [self setMainViewControllerAsRootViewControllerWithStoryboard:storyboard];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.lazulilabs.temp" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Kenkou" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Kenkou.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
