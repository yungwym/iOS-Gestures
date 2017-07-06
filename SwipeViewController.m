//
//  SwipeViewController.m
//  iOS Gestures
//
//  Created by Alex Wymer  on 2017-07-06.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds)-self.view.bounds.size.width/2+15,CGRectGetMidY(self.view.bounds)-50/2 ,self.view.bounds.size.width-30,50)];  //bottom frame
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.clipsToBounds = YES;
    [self.view addSubview:bottomView];

    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bottomView.frame.size.width, bottomView.frame.size.height)]; //top frame
    topView.backgroundColor = [UIColor blueColor];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwipped:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwipped:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [topView addGestureRecognizer:leftSwipe];
    [topView addGestureRecognizer:rightSwipe];
    
    [bottomView addSubview:topView];
    [bottomView bringSubviewToFront:topView]; 
}

- (void)viewSwipped:(UISwipeGestureRecognizer *)sender {
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        [UIView animateWithDuration:0.07
                         animations:^{
                             sender.view.frame = CGRectMake(sender.view.frame.origin.x - 120, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);}
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.07
                                              animations:^{
                                                  sender.view.frame = CGRectMake(sender.view.frame.origin.x + 20, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);}];
                         }];
    } else {
        
        [UIView animateWithDuration:0.07
                         animations:^{
                             sender.view.frame = CGRectMake(sender.view.frame.origin.x + 120, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);}
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.07
                                              animations:^{
                                                  sender.view.frame = CGRectMake(sender.view.frame.origin.x - 20, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);}];
                         }];
    }
}

@end
