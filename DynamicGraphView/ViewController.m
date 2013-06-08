//
//  ViewController.m
//  DynamicGraphView
//
//  Created by Bastian Kohlbauer on 08.06.13.
//  Copyright (c) 2013 Bastian Kohlbauer. All rights reserved.
//
/*
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize graphView = _graphView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // init graphView and set up options
    graphView = [[GraphView alloc]initWithFrame:CGRectMake(10, 10, self.view.frame.size.width-20, 200)];
    [graphView setBackgroundColor:[UIColor yellowColor]];
    [graphView setSpacing:10];
    [graphView setFill:YES];
    [graphView setStrokeColor:[UIColor redColor]];
    [graphView setFillColor:[UIColor orangeColor]];
    [graphView setLineWidth:2];
    [self.view addSubview:graphView];
    
    // setting up a border around the view. for this you need to: #import <QuartzCore/QuartzCore.h> 
    [graphView.layer setBorderColor:[UIColor redColor].CGColor];
    [graphView.layer setBorderWidth:2];
    
    
    // button images
    UIImage *buttonImage = [[UIImage imageNamed:@"orangeButton.png"]
                            resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    UIImage *buttonImageHighlight = [[UIImage imageNamed:@"orangeButtonHighlight.png"]
                                     resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    
    // set up button for pre defined array
    UIButton *setArray = [[UIButton alloc]initWithFrame: CGRectMake((self.view.frame.size.width/2)-80, 230, 160, 40)];
    [setArray setTitle:@"Set Array" forState:UIControlStateNormal];
    [setArray setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [setArray setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    [setArray addTarget:self action:@selector(setArrayButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setArray];
    
    // set up button for points
    UIButton *setPoint = [[UIButton alloc]initWithFrame: CGRectMake((self.view.frame.size.width/2)-80, 280, 160, 40)];
    [setPoint setTitle:@"Set Points" forState:UIControlStateNormal];
    [setPoint setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [setPoint setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    [setPoint addTarget:self action:@selector(setPointButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setPoint];
    
    // set up button for resetting array
    UIButton *resetGraph = [[UIButton alloc]initWithFrame: CGRectMake((self.view.frame.size.width/2)-80, 330, 160, 40)];
    [resetGraph setTitle:@"Reset Graph" forState:UIControlStateNormal];
    [resetGraph setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [resetGraph setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    [resetGraph addTarget:self action:@selector(resetGraphButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetGraph];
    
    // set up button for resetting array
    UIButton *setVisiblePoints = [[UIButton alloc]initWithFrame: CGRectMake((self.view.frame.size.width/2)-80, 380, 160, 40)];
    [setVisiblePoints setTitle:@"Set Visible Points" forState:UIControlStateNormal];
    [setVisiblePoints setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [setVisiblePoints setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
    [setVisiblePoints addTarget:self action:@selector(numberOfPointsVisible) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setVisiblePoints];
}

-(void)setArrayButtonAction {
    
    // set up array for diplay in graphView
    NSArray *points = [[NSArray alloc]initWithObjects:
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:13],
                  [NSNumber numberWithFloat:7],
                  [NSNumber numberWithFloat:9],
                  [NSNumber numberWithFloat:20],
                  [NSNumber numberWithFloat:04],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:0],
                  [NSNumber numberWithFloat:1],
                  [NSNumber numberWithFloat:2],
                  [NSNumber numberWithFloat:3],
                  [NSNumber numberWithFloat:4],
                  [NSNumber numberWithFloat:5],
                  [NSNumber numberWithFloat:6],
                  [NSNumber numberWithFloat:7],
                  [NSNumber numberWithFloat:8],
                  [NSNumber numberWithFloat:9],
                  [NSNumber numberWithFloat:10],
                  [NSNumber numberWithFloat:11],
                  [NSNumber numberWithFloat:12],
                  [NSNumber numberWithFloat:13],
                  [NSNumber numberWithFloat:14],
                  [NSNumber numberWithFloat:13],
                  [NSNumber numberWithFloat:12],
                  [NSNumber numberWithFloat:11],
                  [NSNumber numberWithFloat:10],
                  [NSNumber numberWithFloat:9],
                  [NSNumber numberWithFloat:8],
                  [NSNumber numberWithFloat:7],
                  [NSNumber numberWithFloat:6],
                  [NSNumber numberWithFloat:5],
                  [NSNumber numberWithFloat:4],
                  [NSNumber numberWithFloat:3],
                  [NSNumber numberWithFloat:2],
                  [NSNumber numberWithFloat:1],
                  nil];
    
    [graphView setArray:points];
}

-(void)setPointButtonAction {
    
    float r = arc4random() % 100 + 0; // generating a random number between 0 and 100
    
    [graphView setPoint:r];
    
}

-(void)resetGraphButtonAction {
    
    [graphView resetGraph];
}

-(void)numberOfPointsVisible {
    
    [graphView setNumberOfPointsInGraph:100]; // change the int of points here
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end