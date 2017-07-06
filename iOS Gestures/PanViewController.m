//
//  PanViewController.m
//  iOS Gestures
//
//  Created by Alex Wymer  on 2017-07-06.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    
        //Easy way to set up a pan gesture
    //CGPoint locationInView = [sender locationInView:self.view];
    //sender.view.center = locationInView;
    
        //Better way to set up pan gesture
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
    
}

@end
