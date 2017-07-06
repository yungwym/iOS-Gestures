//
//  ScreenEdgeViewController.m
//  iOS Gestures
//
//  Created by Alex Wymer  on 2017-07-06.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "ScreenEdgeViewController.h"

@interface ScreenEdgeViewController ()

@property (nonatomic) BOOL isShowing;
@property (nonatomic) UIPanGestureRecognizer *pan;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *screenEdge;


@end

@implementation ScreenEdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10,CGRectGetMidY(self.view.bounds)-self.view.bounds.size.width/2,self.view.frame.size.width/4*3, self.view.frame.size.height/2)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    self.screenEdge = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(viewScreenEdged:)];
    self.screenEdge.edges = UIRectEdgeRight;
    
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewScreenEdged:)];
    self.pan.enabled = NO;
    
    [view addGestureRecognizer:self.screenEdge];
    [view addGestureRecognizer:self.pan];
    
}


-(void) viewScreenEdged:(UIGestureRecognizer *) sender {
    
    CGRect newFrame = sender.view.frame;
    
    if(!self.isShowing) {
        if([sender locationInView:self.view].x <= self.view.frame.size.width/3*2){
            self.screenEdge.enabled = NO;
            newFrame.origin.x = self.view.frame.size.width/4*1;
            [UIView animateWithDuration:0.2 animations:^{
                sender.view.frame = newFrame;
            }];
            self.pan.enabled = YES;
            self.isShowing = YES;
        }else{
            newFrame.origin.x += [sender locationInView:sender.view].x;
            sender.view.frame = newFrame;
            
            if((sender.state == UIGestureRecognizerStateEnded) && ([sender locationInView:self.view].x >= self.view.frame.size
                                                                   .width/3*2)){
                newFrame.origin.x = CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10;
                [UIView animateWithDuration:0.2 animations:^{
                    sender.view.frame = newFrame;
                }];
            }
            
        }
    }else{
        if([sender locationInView:self.view].x >= self.view.frame.size.width/3*2){
            self.pan.enabled = NO;
            newFrame.origin.x = CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10;
            [UIView animateWithDuration:0.2 animations:^{
                sender.view.frame = newFrame;
            }];
            self.screenEdge.enabled = YES;
            self.isShowing = NO;
        }else{
            newFrame.origin.x += [sender locationInView:sender.view].x;
            sender.view.frame = newFrame;
            if((sender.state == UIGestureRecognizerStateEnded) && ([sender locationInView:self.view].x <= self.view.frame.size.width/3*2)){
                newFrame.origin.x = self.view.frame.size
                .width/4*1;
                [UIView animateWithDuration:0.2 animations:^{
                    sender.view.frame = newFrame;
                }];
            }
            
        }
    }
}


@end
