ITActionManager
===============

Method dispatcher and progress handler.

Example
-------

```objc
// Invocations
NSInvocation *inv = [ITActionManager invocationWithTarget:yourTarget andSelector:@selector(yourSelector:)];
NSInvocation *inv2 = [ITActionManager invocationWithTarget:yourTarget2 andSelector:@selector(yourSelector2:)];
```

```objc
// Action manager
ITActionManager *actionManager = [[ITActionManager alloc] init];
[actionManager addActionsProgressHandler:^(float percentProgress) {
	NSLog(@"Progress - %f", percentProgress);
}];
[actionManager addActionsResultHandler:^(float result) {
	NSLog(@"Completed.");
}];
[actionManager performMethods:@[inv, inv2, inv3, inv, inv2, inv3]];
```

Inspired by [Sebastien Windal](https://github.com/sebastienwindal) on [Callback handlers using blocks](https://github.com/sebastienwindal/iOSPatterns/wiki/Callback-handlers-using-blocks)