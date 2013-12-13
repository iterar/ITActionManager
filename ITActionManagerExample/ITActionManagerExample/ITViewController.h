//
//  ITViewController.h
//  ITActionManagerExample
//
//  Created by Tiago Alves on 13/12/13.
//  Copyright (c) 2013 Iterar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIProgressView *progressView;

- (void)countUntil:(id)number;

@end
