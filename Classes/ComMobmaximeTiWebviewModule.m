/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "ComMobmaximeTiWebviewModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

//Reference links :
// 1. http://stackoverflow.com/questions/7567129/delete-cookies-uiwebview - main part
// 2. https://gist.github.com/rubdottocom/2720834

@implementation ComMobmaximeTiWebviewModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"f13242b5-b355-47cb-aeef-982eb6c22c98";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"com.mobmaxime.TiWebview";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs
-(id)listCookies:(id)args {
    ENSURE_SINGLE_ARG(args,NSString);
    NSHTTPCookie *Cookie;
    NSHTTPCookieStorage *CookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSMutableDictionary *CookiesDict = [[NSMutableDictionary alloc] init];
    
    for(Cookie in [CookieStorage cookiesForURL:[NSURL URLWithString:args]]) {
        [CookiesDict setValue:Cookie.value forKey:Cookie.name];
    }
    return CookiesDict;
}

-(void)deleteAllCoockie:(id)args {
    ENSURE_SINGLE_ARG(args,NSString);
    NSHTTPCookieStorage* cookies = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *allCookies = [cookies cookies];
    for(NSHTTPCookie *cookie in allCookies) {
        if([[cookie domain] rangeOfString:args].location != NSNotFound) {
            NSLog(@"[INFO] Cookie is ==>> %@", cookie);
            [cookies deleteCookie:cookie];
        }
    }
}

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

@end
