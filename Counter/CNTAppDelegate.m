//
//  CNTAppDelegate.m
//  Counter
//
//  Created by Jeff Gilbert on 8/22/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTAppDelegate.h"
#import "CACountInteractor.h"
#import "CACountPresenter.h"
#import "CACountViewController.h"


@implementation CNTAppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self createScreen];

    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)createScreen
{
	CACountViewController* view = [[CACountViewController alloc] init];
	CACountPresenter* presenter = [[CACountPresenter alloc] init];
	CACountInteractor* interactor = [[CACountInteractor alloc] init];

    view.presenter = presenter;
    presenter.view = view;
    
    presenter.interactor = interactor;
    interactor.output = presenter;
	
	self.window.rootViewController = view;
}

@end
