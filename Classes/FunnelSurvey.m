//
//  FunnelSurvey.m
//  iPhoneFunnel
//
//  Created by Ryan Panchadsaram on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FunnelSurvey.h"

@implementation FunnelSurvey
@synthesize statusTimer;
@synthesize delayTimer;

// Hide and dismiss survey - Button
-(IBAction)closeSurvey:(id)sender{
	//Hide Survey
	[self dismissModalViewControllerAnimated:YES];
	
	//Stop Timer
	[statusTimer invalidate];
	self.statusTimer = nil;
	
}

// Checks if survey has been completed
- (void)updateCounter:(NSTimer *)theTimer{

	NSString *checkComplete = [webView stringByEvaluatingJavaScriptFromString:@"sp.surveyDone"];
	
	if ([checkComplete isEqual:@"true"]) {
		//Hide survey when complete
		self.delayTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f
															target:self
														  selector:@selector(dismissSurvey:)
														  userInfo:nil
														   repeats:YES];
	}else{
		//Survey in progress
	}
}

// Hides completed survey
- (void)dismissSurvey:(NSTimer *)theTimer{
	//Hide Survey
	[self dismissModalViewControllerAnimated:YES];
	
	//Stop Timer
	[statusTimer invalidate];
	self.statusTimer = nil;
}

// Animated loader for survey
-(void)loading{
	if(!webView.loading)
		[activityIndicator stopAnimating];
	
	else
		[activityIndicator startAnimating];
}

// Navigate to survey url
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//Load Survey URL
	//Change this to the URL provided by Funnel
	NSURL *url = [NSURL URLWithString:@"https://fnnl.it/s/38"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[webView loadRequest:request];
	
	//Animating activity indicator
	timer = [NSTimer scheduledTimerWithTimeInterval:(1.0/2.0) target:self selector:@selector(loading) userInfo:nil repeats:YES];
	
	//Polling the Survey Status
	self.statusTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f
									 target:self
								   selector:@selector(updateCounter:)
								   userInfo:nil
									repeats:YES];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[activityIndicator release];
	activityIndicator = nil;
    [super dealloc];
}


@end
