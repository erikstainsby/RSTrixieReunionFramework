//
//  RSReactionPlugin.m
//  RSTrixiePluginFramework
//
//  Created by Erik Stainsby on 12-02-25.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//

#import "RSReactionPlugin.h"

@interface RSReactionPlugin ()

@end

@implementation RSReactionPlugin

@dynamic action;
@synthesize pluginName=_pluginName;
@synthesize targetField=_targetField;
@synthesize deltaField=_deltaField;
@synthesize opacityField=_opacityField;
@synthesize delayField=_delayField;
@synthesize periodField=_periodField;
@synthesize easingField=_easingField;
@synthesize callbackField=_callbackField;

- (NSString *) callback {
	return [NSString stringWithFormat:@"The method [callback] requires an override in the %@ instance of subclass %@",[self pluginName],[self className]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void) setAction:(NSString *)anAction {
	_action = anAction;
}

- (NSString *) action {
	if( nil != _action ) {
		return _action;
	}
	return [[self pluginName] lowercaseString];
}

- (BOOL) hasTargetField {
	return NO;
}
- (BOOL) hasDeltaField {
	return NO;
}
- (BOOL) hasDelayField {
	return NO;
}
- (BOOL) hasPeriodField {
	return NO;
}
- (BOOL) hasOpacityField {
	return NO;
}
- (BOOL) hasEasingField {
	return NO;
}
- (BOOL) hasCallbackField {
	return NO;
}

- (NSString*) emitScript {
	
	NSString * str = @"";
	if([[self delayField] integerValue]) {
		str = [str stringByAppendingFormat:@".delay(%lu)",[[self delayField] integerValue]];
	}
	
	NSString * params = @"";
	if([[[self periodField] stringValue] length] > 0) {
		params = [params stringByAppendingFormat:@"%lu",[[self periodField] integerValue]];
	}
	if([[self opacityField] floatValue]) {
		if([params length] > 0) {
			params = [params stringByAppendingString:@","];
		}
		params = [params stringByAppendingFormat:@"%2f",[[self opacityField] floatValue]];
	}
	if([[[self deltaField] stringValue] length] > 0 ) {
		if([params length] > 0) {
			params = [params stringByAppendingString:@","];
		}
		params = [params stringByAppendingFormat:@"'%@'",[[self deltaField] stringValue]];
	}
	if([[[self easingField] stringValue] length] > 0) {
		if([params length] > 0) {
			params = [params stringByAppendingString:@","];
		}
		params = [params stringByAppendingFormat:@"'%@'",[[self easingField] stringValue]];
	}
	if([[[self callbackField] stringValue] length] > 0) {
		if([params length] > 0) {
			params = [params stringByAppendingString:@","];
		}
		params = [params stringByAppendingFormat:@"%@",[[self callbackField] stringValue]];
	}
	
	str = [str stringByAppendingFormat:@".%@(%@)",[self action],params];
	params = nil;
	return str;
}

- (void) resetForm {
	if( [self hasTargetField]) {	[[self targetField]		setStringValue:@""];  }
	if( [self hasDeltaField])  {	[[self deltaField]		setStringValue:@""];  }
	if( [self hasOpacityField]){	[[self opacityField]	setStringValue:@""];  }
	if( [self hasDelayField])  {	[[self delayField]		setStringValue:@""];  } 
	if( [self hasPeriodField]) {	[[self periodField]		setStringValue:@""];  } 
	if( [self hasEasingField]) {	[[self easingField]		setStringValue:@""];  }
	if( [self hasCallbackField]){	[[self callbackField]	setStringValue:@""];  }
}

@end
