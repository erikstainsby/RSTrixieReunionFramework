//
//  RSActionRule.m
//  RSTrixiePluginFramework
//
//  Created by Erik Stainsby on 12-02-25.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//

#import "RSActionRule.h"

@implementation RSActionRule

@synthesize event;
@synthesize selector;
@synthesize preventDefault;
@synthesize stopBubbling;

- (NSString *) description {
	NSString * desc = [NSString stringWithFormat:@"<%@ %p> { \n",[self className],self];
	desc = [desc stringByAppendingFormat:@"\t'event':'%@',\n",			[self event]];
	desc = [desc stringByAppendingFormat:@"\t'selector':'%@',\n",		[self selector]];
	desc = [desc stringByAppendingFormat:@"\t'preventDefault':%i,\n",	[self preventDefault]];
	desc = [desc stringByAppendingFormat:@"\t'stopBubbling':%i\n",		[self stopBubbling]];
	desc = [desc stringByAppendingString:@"}"];
	return desc;
}

- (NSString *) trigger {
	return [NSString stringWithFormat:@"$('%@').bind('%@',",[self selector],[self event]];
}

- (id) valueForUndefinedKey:(NSString *) key {
	NSLog(@"%s- [%04d] Undefined key: %@", __PRETTY_FUNCTION__, __LINE__, key);
	return @"undefined";
}

@end
