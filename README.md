ITActionManager
===============

Method dispatcher and progress handler.

### Installation with CocoaPods (Podfile)

```ruby
pod "ITActionManager"
```

### Manual installation

Copy "ITActionManager" (and "NSInvocation+SimpleCreation" if you want to use the helper methods to build NSInvocation's) to your project and import when you want to use them.

```objc
#import "ITActionManager.h"
#import "NSInvocation+SimpleCreation.h"
```

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
[actionManager performMethods:@[inv, inv2]];
```

Inspired by [Sebastien Windal](https://github.com/sebastienwindal) on [Callback handlers using blocks](https://github.com/sebastienwindal/iOSPatterns/wiki/Callback-handlers-using-blocks)