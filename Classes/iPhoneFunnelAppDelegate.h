//
//  iPhoneFunnelAppDelegate.h
//  iPhoneFunnel
//
//  Created by Ryan Panchadsaram on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iPhoneFunnelViewController;

@interface iPhoneFunnelAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iPhoneFunnelViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iPhoneFunnelViewController *viewController;

@end

