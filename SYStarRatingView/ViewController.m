//
//  ViewController.m
//  SYStarRatingView
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 suya. All rights reserved.
//

#import "ViewController.h"
#import "SYStarRatingView.h"
@interface ViewController ()<StarRatingViewDelegate>
@property (nonatomic ,strong) UILabel *starScoreLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.starScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 80, 50)];
    self.starScoreLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.starScoreLabel];
    
    
    SYStarRatingView *syStarRatingViewOne = [[SYStarRatingView alloc] initWithFrame:CGRectMake(50, 50, 250, 50)];
    syStarRatingViewOne.delegate = self;
    syStarRatingViewOne.foregroundViewColor = [UIColor orangeColor];
    [self.view addSubview:syStarRatingViewOne];
    
    SYStarRatingView *syStarRatingViewTwo = [[SYStarRatingView alloc] initWithFrame:CGRectMake(50, 120, 250, 50)];
    syStarRatingViewTwo.backgroundViewColor = [UIColor greenColor];
    syStarRatingViewTwo.foregroundViewColor = [UIColor orangeColor];
    [self.view addSubview:syStarRatingViewTwo];
//    fore
    
    SYStarRatingView *syStarRatingViewThree = [[SYStarRatingView alloc] initWithFrame:CGRectMake(50, 190, 250, 50)];
    syStarRatingViewThree.foregroundImageName = @"fore.jpg";
    syStarRatingViewThree.backgroundImageName = @"back.jpg";
    [self.view addSubview:syStarRatingViewThree];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)starRatingView:(SYStarRatingView *)view score:(float)score
{
    self.starScoreLabel.text = [NSString stringWithFormat:@"%0.2f",score * 10 ];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
