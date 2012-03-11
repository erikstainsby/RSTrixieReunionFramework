//
//  RSConditionRule.m
//  RSTrixiePluginFramework
//
//  Created by Erik Stainsby on 12-02-25.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//

#import "RSConditionRule.h"

@implementation RSConditionRule


@synthesize script=_script;


- (id) valueForUndefinedKey:(NSString *) key {
	NSLog(@"%s- [%04d] Undefined key: %@", __PRETTY_FUNCTION__, __LINE__, key);
	return @"undefined";
}

@end
