//
//  NSInvocation+SimpleCreation.h
//  MAPI
//
//  Created by Tiago Alves on 08/12/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSInvocation (SimpleCreation)

+ (NSInvocation*)invocationWithTarget:(id)target andSelector:(SEL)selector;
+ (NSInvocation*)invocationWithTarget:(id)target selector:(SEL)selector andArguments:(NSArray*)arguments;

@end
