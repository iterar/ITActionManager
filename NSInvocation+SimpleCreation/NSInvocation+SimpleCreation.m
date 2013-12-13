//
//  NSInvocation+SimpleCreation.m
//  MAPI
//
//  Created by Tiago Alves on 08/12/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import "NSInvocation+SimpleCreation.h"

@implementation NSInvocation (SimpleCreation)

+ (NSInvocation*)invocationWithTarget:(id)target andSelector:(SEL)selector {
    
    NSMethodSignature *sig = [[target class] instanceMethodSignatureForSelector:selector];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
    [inv setTarget:target];
    [inv setSelector:selector];
    
    return inv;
    
}

+ (NSInvocation*)invocationWithTarget:(id)target selector:(SEL)selector andArguments:(NSArray *)arguments {
    
    NSInvocation *inv = [NSInvocation invocationWithTarget:target andSelector:selector];
    
    int argumentIndex = 2;
    for (int i = 0; i < arguments.count; i++) {
        id argument = [arguments objectAtIndex:i];
        [inv setArgument:&argument atIndex:argumentIndex];
        argumentIndex += 1;
    }
    [inv retainArguments];
    
    return inv;
    
}

@end
