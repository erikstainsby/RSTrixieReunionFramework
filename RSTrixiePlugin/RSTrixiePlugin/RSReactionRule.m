//
//  RSReactionRule.m
//  RSTrixiePluginFramework
//
//  Created by Erik Stainsby on 12-02-25.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//

#import "RSReactionRule.h"

@implementation RSReactionRule

@synthesize script=_script;

- (NSString *) description {
	return _script;
}

- (id) valueForUndefinedKey:(NSString *) key {
	NSLog(@"%s- [%04d] Undefined key: %@", __PRETTY_FUNCTION__, __LINE__, key);
	return @"undefined";
}

@end
