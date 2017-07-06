//
//  RotateViewController.m
//  iOS Gestures
//
//  Created by Alex Wymer  on 2017-07-06.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *sqaure = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) -100/2, CGRectGetMidY(self.view.bounds) - 100/2, 100, 100)];
    sqaure.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:sqaure];
    [self.view bringSubviewToFront:sqaure];
    
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
    
    [sqaure addGestureRecognizer:rotate];
}


- (void)rotateView:(UIRotationGestureRecognizer *)sender {
    
    [sender.view setTransform:CGAffineTransformMakeRotation(sender.rotation)];
}

@end
