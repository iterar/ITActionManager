//
//  ITActionManager.m
//  MAPI
//
//  Created by Tiago Alves on 06/12/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import "ITActionManager.h"

@interface ITActionManager() {
    float totalOperations;
    float missingOperations;
}

@property (nonatomic, strong) NSArray *invocations;
@property (nonatomic, strong) NSMutableArray *progressHandlers;
@property (nonatomic, strong) NSMutableArray *completionHandlers;

@end

@implementation ITActionManager

-(NSMutableArray *) progressHandlers
{
    if (_progressHandlers == nil)
        _progressHandlers = [[ NSMutableArray alloc] init];
    
    return _progressHandlers;
}

-(NSMutableArray *) completionHandlers
{
    if (_completionHandlers == nil)
        _completionHandlers = [[ NSMutableArray alloc] init];
    
    return _completionHandlers;
}

- (void)performMethods:(NSArray*)invocations {
    
    totalOperations = invocations.count;
    missingOperations = totalOperations;
    self.invocations = invocations;
    [self performNextInvocation];
    
}

- (void)performNextInvocation {
    if (self.invocations.count >= 1) {
        NSInvocation *invocation = [self.invocations objectAtIndex:missingOperations-1];
        [self performSelectorInBackground:@selector(performInvocation:) withObject:invocation];
    } else {
        return;
    }
    
}

- (void)performInvocation:(NSInvocation*)invocation {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(void) {
        [invocation invoke];
        
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            missingOperations -= 1;
            [self.progressHandlers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                progressHandler handler = obj;
                handler((totalOperations-missingOperations) / totalOperations);
            }];
            if (missingOperations == 0) {
                [self.completionHandlers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    completionHandler handler = obj;
                    handler(1);
                }];
            } else {
                [self performNextInvocation];
            }
        });
    });
}

- (void)addActionsProgressHandler:(progressHandler)handler {
    [self.progressHandlers addObject:[handler copy]];
}

- (void)addActionsResultHandler:(completionHandler)handler {
    [self.completionHandlers addObject:[handler copy]];
}

+ (NSInvocation*)invocationWithTarget:(id)target andSelector:(SEL)selector {
    
    NSMethodSignature *sig = [[target class] instanceMethodSignatureForSelector:selector];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
    [inv setTarget:target];
    [inv setSelector:selector];
    
    return inv;
    
}

@end
