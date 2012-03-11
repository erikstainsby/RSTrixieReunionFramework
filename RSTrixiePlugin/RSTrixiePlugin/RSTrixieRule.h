//
//  RSCompoundRule.h
//  RSTrixiePluginFramework
//
//  Created by Erik Stainsby on 12-02-25.
//  Copyright (c) 2012 Roaring Sky. All rights reserved.
//

#import "RSAbstractRule.h"
#import "RSActionRule.h"
#import "RSReactionRule.h"
#import "RSConditionRule.h"

@interface RSTrixieRule : RSAbstractRule

@property (retain) RSActionRule * action;
@property (retain) NSArray * reactions;
@property (retain) NSArray * conditions;
@property (retain) NSString * comment;

- (NSString *)	selector;
- (NSString *)	event;
- (BOOL)		preventDefault;
- (BOOL)		stopBubbling;
- (NSString *)  script;

- (NSString *)	emitScript;
- (NSString *)	description;

- (id) valueForUndefinedKey:(NSString *) key;

@end
