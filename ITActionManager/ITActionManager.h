//
//  ITActionManager.h
//  MAPI
//
//  Created by Tiago Alves on 06/12/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^progressHandler)(float percentProgress);
typedef void (^completionHandler)(float result);

@interface ITActionManager : NSObject

- (void)performMethods:(NSArray*)selectors;

- (void)addActionsProgressHandler:(progressHandler)handler;
- (void)addActionsResultHandler:(completionHandler)handler;

+ (NSInvocation*)invocationWithTarget:(id)target andSelector:(SEL)selector;

@end
