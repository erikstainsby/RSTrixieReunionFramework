//
//  RSTrixiePlugin.m
//  RSTrixiePlugin
//
//  Created by Erik Stainsby on 12-02-15.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//

#import "RSTrixiePlugin.h"

#define kRSErrorFormat @"%s is not implemented yet in subclass %@"
#define kRSExceptionName @"RSTrixieNotImplementedException"

@interface RSTrixiePlugin () 

@end

@implementation RSTrixiePlugin

@synthesize pluginName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if( nibNameOrNil == nil ) nibNameOrNil = @"RSTrixiePlugin";
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self setPluginName: @"Not Implemented"];
	}
    return self;
}

- (NSString*) nibName {
	return [self className];
}

- (NSBundle*) nibBundle {	
	NSString * myBundlePath = [NSBundle pathForResource:[self nibName] 
												 ofType:@"bundle" 
											inDirectory:[[NSBundle mainBundle] builtInPlugInsPath]];
	return [NSBundle bundleWithPath:myBundlePath];
}

- (BOOL) hasSelectorField { 
	return YES; 
} 

@end
