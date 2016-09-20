//
//  CNTAppDelegate.m
//  Counter
//
//  Created by Jeff Gilbert on 8/22/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTAppDelegate.h"
#import "CNTCountInteractor.h"
#import "CNTCountPresenter.h"
#import "CNTCountViewController.h"

@implementation CNTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self createScreen];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)createScreen {
	CNTCountViewController *view = [[CNTCountViewController alloc] init];
	CNTCountPresenter *presenter = [[CNTCountPresenter alloc] init];
	CNTCountInteractor *interactor = [[CNTCountInteractor alloc] init];
    view.presenter = presenter;
    presenter.view = view;
    presenter.interactor = interactor;
    interactor.output = presenter;
	self.window.rootViewController = view;
}

@end
