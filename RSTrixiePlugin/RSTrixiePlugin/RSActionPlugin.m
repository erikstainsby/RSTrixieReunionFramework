//
//  RSActionPlugin.m
//  RSTrixiePluginFramework
//
//  Created by Erik Stainsby on 12-02-25.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//

#import "RSActionPlugin.h"

@interface RSActionPlugin ()

@end

@implementation RSActionPlugin

@synthesize event=_event;
@synthesize selectorField=_selectorField;
@synthesize preventDefaultButton=_preventDefaultButton;
@synthesize stopBubblingButton=_stopBubblingButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     	
    }
    return self;
}

- (void) setEvent:(NSString *)anEvent {
	_event = anEvent;
}

- (NSString *) event {
	if( nil != _event ) {
		return _event;
	}
	return [[self pluginName] lowercaseString];
}

- (NSString *) trigger {
	return [NSString stringWithFormat:@"$('%@')",[[self selectorField] stringValue]];
}

- (BOOL) hasPreventDefaultButton { 
	return NO; 
} 
- (BOOL) hasStopBubblingButton { 
	return NO; 
} 
- (BOOL) preventDefault {
	return NO;
}
- (BOOL) stopBubbling {
	return NO;
}


- (void) resetForm {
	[[self selectorField]  setStringValue:@""];
	if([self hasPreventDefaultButton]) {
		[[self preventDefaultButton] setState:NSOffState];
	}
	if([self hasStopBubblingButton]) {
		[[self stopBubblingButton] setState:NSOffState];
	}
}

@end
