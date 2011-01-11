//
//  FunnelSurvey.h
//  iPhoneFunnel
//
//  Created by Ryan Panchadsaram on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FunnelSurvey : UIViewController {
	IBOutlet UIWebView *webView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	NSTimer *timer;
}

-(IBAction)closeSurvey:(id)sender;

@property (nonatomic, retain) NSTimer *statusTimer;
@property (nonatomic, retain) NSTimer *delayTimer;

@end
