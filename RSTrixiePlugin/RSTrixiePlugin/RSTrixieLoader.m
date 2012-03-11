//
//  RSTrixieLoader.m
//  RSTrixiePluginFramework
//
//  Created by Erik Stainsby on 12-03-03.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//


#import "RSTrixieLoader.h"

@implementation RSTrixieLoader


- (NSMutableArray*) loadNotImplementedPlugin  {

	NSString * path = [[NSBundle mainBundle] pathForResource:@"NotImplementedPlugin" ofType:@"bundle" inDirectory:@"../Plugins"];
	
	NSLog(@"%s- [%04d] path: %@", __PRETTY_FUNCTION__, __LINE__, path);
	
	NSMutableArray * ourPlugins = [NSMutableArray array];

	NSBundle * pluginBundle = [NSBundle bundleWithPath:path];
		
	id bundleId = [pluginBundle bundleIdentifier];
	NSLog(@"%s- [%04d] bundleId: %@", __PRETTY_FUNCTION__, __LINE__, bundleId);
		
	[pluginBundle load];
	
	Class prinClass = [pluginBundle principalClass];
		
	id plugin = [[prinClass alloc] initWithNibName:[prinClass className] bundle:bundleId];
	NSLog(@"%s- [%04d] plugin className: %@", __PRETTY_FUNCTION__, __LINE__, [plugin className]);
	
	[ourPlugins addObject:plugin];
		
	plugin = nil;
	pluginBundle = nil;
	
	return ourPlugins;	
	
}

- (NSArray*) loadPluginsWithPrefix:(NSString*)prefix ofType:(NSString*)fileExt {
	
	NSBundle * main = [NSBundle mainBundle];
	NSArray * all = [main pathsForResourcesOfType:fileExt inDirectory:@"../Plugins"];
	
	NSMutableArray * ourPlugins = [NSMutableArray array];
	
	id plugin = nil;
	NSBundle * pluginBundle = nil;
	id bundleId = nil;
	
	for(NSString * path in all)
	{
		NSString * filename = [path lastPathComponent];
		
		if( ![filename hasPrefix:prefix] ) 
		{
			// skip
			continue;
		}
		
		pluginBundle = [NSBundle bundleWithPath:path];
		
		bundleId = [pluginBundle bundleIdentifier];
		
			//	NSLog(@"%s- [%04d] %@", __PRETTY_FUNCTION__, __LINE__, bundleId);
		
		[pluginBundle load];
		
		Class prinClass = [pluginBundle principalClass];
		if(![prinClass isSubclassOfClass:[RSTrixiePlugin class]]) {
				// skip 
			continue;
		}
		
		plugin = [[prinClass alloc] initWithNibName:[prinClass className] bundle:bundleId];
		[ourPlugins addObject:plugin];
		
		plugin = nil;
		pluginBundle = nil;
	}
	
		// backstop the plugin loader with a default message
	if([ourPlugins count] < 1)
	{
		ourPlugins = [self loadNotImplementedPlugin];
	}
	
	return ourPlugins;
}



@end
