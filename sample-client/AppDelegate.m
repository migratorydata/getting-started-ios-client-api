#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;

@synthesize liveStatus;
@synthesize liveMessage;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"#### didFinishLaunchingWithOptions");

    client = [MigratoryDataClient new];
    
    [client setLogLevel: LOG_TRACE];

    [client setEncryption: ENCRYPTION];
    [client setEntitlementToken: TOKEN];
    
    listener = [[SampleListener alloc] initWithMessageField:liveMessage statusField:liveStatus];
    [client setListener: listener];
    
    serverList = [NSMutableArray new];
    [serverList addObject: SERVER];
    [client setServers: serverList];
    
    subjectList = [NSMutableArray new];
    [subjectList addObject: SUBJECT];
    [client subscribe: subjectList];
    
    [client connect];
    
    window.rootViewController = [[UIViewController alloc]initWithNibName:nil bundle:nil];;
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"#### applicationWillEnterForeground");

    if (client != nil)
    {
        [client resume];
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"#### applicationDidEnterBackground");

    if (client != nil)
    {
        [client pause];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"#### applicationWillTerminate");
}

- (void)dealloc {
    NSLog(@"#### dealloc");
    
    if (listener != nil) {
        [listener release];
        listener = nil;
    }
    
    if (client != nil) {
        [client dispose];
        [client release];
        client = nil;
    }
    
    [subjectList release];

    [serverList release];
    
    [liveMessage release];
    
    [liveStatus release];
    
    [window release];
    
    [super dealloc];
}

@end
