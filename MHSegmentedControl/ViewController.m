//
//  ViewController.m
//  MHSegmentedControl
//
//  Created by Mark Hall on 2015-07-18.
//  Copyright © 2015 Mark Hall. All rights reserved.
//

#import "ViewController.h"
#import "MHSegmentedControl.h"

@interface ViewController () <MHSegmentedControlDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MHSegmentedControl *seg = [[MHSegmentedControl alloc]initWithFrame:CGRectMake(60, 200, 280, 31) Option:@"Option 1" andOption:@"Option 2" backgroundColor:[UIColor redColor] selectedIndex:0];
    seg.delegate = self;
    [self.view addSubview:seg];
}


- (void)didTransitionToIndex:(NSInteger)index
{
    NSLog(@"%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
