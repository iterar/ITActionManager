//
//  ITViewController.m
//  ITActionManagerExample
//
//  Created by Tiago Alves on 13/12/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import "ITViewController.h"
#import "ITActionManager.h"
#import "NSInvocation+SimpleCreation.h"

@interface ITViewController ()

@end

@implementation ITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    // Invocations
    NSInvocation *inv1 = [NSInvocation invocationWithTarget:self
                                                   selector:@selector(countUntil:)
                                               andArguments:[NSArray arrayWithObject:[NSNumber numberWithInt:1000]]];
    NSInvocation *inv2 = [NSInvocation invocationWithTarget:self
                                                   selector:@selector(countUntil:)
                                               andArguments:[NSArray arrayWithObject:[NSNumber numberWithInt:2000]]];
    NSInvocation *inv3 = [NSInvocation invocationWithTarget:self
                                                   selector:@selector(countUntil:)
                                               andArguments:[NSArray arrayWithObject:[NSNumber numberWithInt:3000]]];
    NSInvocation *inv4 = [NSInvocation invocationWithTarget:self
                                                   selector:@selector(countUntil:)
                                               andArguments:[NSArray arrayWithObject:[NSNumber numberWithInt:2000]]];
    NSInvocation *inv5 = [NSInvocation invocationWithTarget:self
                                                   selector:@selector(countUntil:)
                                               andArguments:[NSArray arrayWithObject:[NSNumber numberWithInt:1000]]];
    
    // Action manager
    __block ITViewController *weakSelf = self;
    ITActionManager *actionManager = [[ITActionManager alloc] init];
    self.progressView.progress = 0.0;
    [actionManager addActionsProgressHandler:^(float percentProgress) {
        NSLog(@"Progress - %f", percentProgress);
        weakSelf.progressView.progress = percentProgress;
    }];
    [actionManager addActionsResultHandler:^(float result) {
        [weakSelf.progressView setProgress:1.0 animated:YES];
        [weakSelf performSelector:@selector(endLoading:) withObject:nil afterDelay:0.5];
    }];
    [actionManager performMethods:@[inv1, inv2, inv3, inv4, inv5]];
}

- (void)countUntil:(NSNumber*)number {
    for (int i = 0; i < number.integerValue; i++) {
        NSLog(@"This is number: %i", i);
    }
}

- (void)endLoading:(id)sender {
    NSLog(@"Finished loading");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
