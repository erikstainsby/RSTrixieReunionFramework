//
//  RSTrixieRule.m
//  RSTrixiePluginFramework
//
//  Created by Erik Stainsby on 12-02-17.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//

#import "RSAbstractRule.h"

@implementation RSAbstractRule

- (id) valueForUndefinedKey:(NSString *) key {
	NSLog(@"%s- [%04d] Undefined key: %@", __PRETTY_FUNCTION__, __LINE__, key);
	return @"undefined";
}

- (id) copyWithZone:(NSZone*)zone {
	return self;
}

@end
