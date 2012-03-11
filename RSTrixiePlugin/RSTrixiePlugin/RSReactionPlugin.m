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


- (NSString*) emitScript {
	
	NSString * str = [NSString stringWithFormat:@"$('%@')",[[self targetField] stringValue]];
	
	if([[self delayField] integerValue]) {
		str = [str stringByAppendingFormat:@".delay(%lu)",[[self delayField] integerValue]];
	}
	
	NSString * params = @"";
	
	if([[[self periodField] stringValue] length] > 0) {
		params = [params stringByAppendingFormat:@"%lu",[[self periodField] integerValue]];
	}
	if([[self opacityField] floatValue]) {
		params = [params stringByAppendingFormat:@",%.3f",[[self opacityField] floatValue]];
	}
	if([[[self deltaField] stringValue] length] > 0 ) {
		params = [params stringByAppendingFormat:@",'%@'",[[self deltaField] stringValue]];
	}
	if([[[self easingField] stringValue] length] > 0) {
		params = [params stringByAppendingFormat:@",\"%@\"",[[self easingField] stringValue]];
	}
	if([[[self callbackField] stringValue] length] > 0) {
		params = [params stringByAppendingFormat:@",%@",[[self callbackField] stringValue]];
	}
	
	str = [str stringByAppendingFormat:@".%@(%@);",[self action],params];
	params = nil;
	return str;
}


@end
