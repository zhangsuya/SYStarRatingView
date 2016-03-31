//
//  ViewController.m
//  SYStarRatingView
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 suya. All rights reserved.
//

#import "ViewController.h"
#import "SYStarRatingView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYStarRatingView *syStarRatingView = [[SYStarRatingView alloc] initWithFrame:CGRectMake(0, 0, 300, 80)];
    syStarRatingView.foregroundViewColor = [UIColor orangeColor];
    [self.view addSubview:syStarRatingView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
