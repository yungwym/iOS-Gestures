//
//  TapViewController.m
//  iOS Gestures
//
//  Created by Alex Wymer  on 2017-07-06.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    [view addGestureRecognizer:tap];
    
}



-(void)viewTapped:(UITapGestureRecognizer *)sender {
    
    UIColor *current = sender.view.backgroundColor;
    UIColor *purp = [UIColor purpleColor];
    
    UIColor *color = [current isEqual:purp] ? [UIColor whiteColor] : purp;
    
    sender.view.backgroundColor = color;
    
    
}

@end
