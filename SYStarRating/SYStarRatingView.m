//
//  SYStarRatingView.m
//  SYStarRatingView
//
//  Created by Mac on 16/3/30.
//  Copyright © 2016年 suya. All rights reserved.
//

#import "SYStarRatingView.h"
#import "UIImage+Tint.h"
@interface SYStarRatingView()
@property (nonatomic, assign, readonly) NSInteger numberOfStar;
@property (nonatomic, strong) UIView *starBackgroundView;
@property (nonatomic, strong) UIView *starForegroundView;
@property (nonatomic, strong) NSMutableArray *foregroundImageViewArray;
@property (nonatomic, strong) NSMutableArray *backgroundImageViewArray;
@end
@implementation SYStarRatingView

- (instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStar:kNUMBER_OF_STAR];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _numberOfStar = kNUMBER_OF_STAR;
    [self commonInit];
}

/**
 *  初始化SYStarRatingView
 *
 *  @param frame  Rectangles
 *  @param number 星星个数
 *
 *  @return SYStarRatingViewObject
 */
- (instancetype)initWithFrame:(CGRect)frame numberOfStar:(NSInteger)number
{
    self = [super initWithFrame:frame];
    if (self) {
        _numberOfStar = number;
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.foregroundViewColor = [UIColor clearColor];
    self.backgroundViewColor = [UIColor clearColor];
    self.foregroundImageName = @"foregroundStar";
    self.backgroundImageName = @"backgroundStar";
    self.foregroundImageViewArray = [NSMutableArray array];
    self.backgroundImageViewArray = [NSMutableArray array];
    self.starBackgroundView = [self buidlStarViewWithImageName:self.backgroundImageName isForegroundColor:NO];
    self.starForegroundView = [self buidlStarViewWithImageName:self.foregroundImageName isForegroundColor:YES];
    [self addSubview:self.starBackgroundView];
    [self addSubview:self.starForegroundView];
    [self registerForKVO];
}

#pragma mark -
#pragma mark - Set Score

/**
 *  设置控件分数
 *
 *  @param score     分数，必须在 0 － 1 之间
 *  @param isAnimate 是否启用动画
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate
{
    [self setScore:score withAnimation:isAnimate completion:^(BOOL finished){}];
}

//-(void)setForegroundImageName:(NSString *)foregroundImageName
//{
//    self.foregroundImageName = foregroundImageName;
//    if (self.starForegroundView) {
//        [self.starForegroundView removeFromSuperview];
//    }
//    self.starForegroundView = [self buidlStarViewWithImageName:self.foregroundImageName];
//}
/**
 *  设置控件分数
 *
 *  @param score      分数，必须在 0 － 1 之间
 *  @param isAnimate  是否启用动画
 *  @param completion 动画完成block
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate completion:(void (^)(BOOL finished))completion
{
    NSAssert((score >= 0.0)&&(score <= 1.0), @"score must be between 0 and 1");
    
    if (score < 0)
    {
        score = 0;
    }
    
    if (score > 1)
    {
        score = 1;
    }
    
    CGPoint point = CGPointMake(score * self.frame.size.width, 0);
    
    if(isAnimate)
    {
        __weak __typeof(self)weakSelf = self;
        
        [UIView animateWithDuration:0.2 animations:^
         {
             [weakSelf changeStarForegroundViewWithPoint:point];
             
         } completion:^(BOOL finished)
         {
             if (completion)
             {
                 completion(finished);
             }
         }];
    }
    else
    {
        [self changeStarForegroundViewWithPoint:point];
    }
}

#pragma mark -
#pragma mark - Touche Event
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if(CGRectContainsPoint(rect,point))
    {
        [self changeStarForegroundViewWithPoint:point];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    __weak __typeof(self)weakSelf = self;
    
    [UIView animateWithDuration:0.2 animations:^
     {
         [weakSelf changeStarForegroundViewWithPoint:point];
     }];
}

#pragma mark -
#pragma mark - Bulid Star View

/**
 *  通过图片构建星星视图
 *
 *  @param imageName 图片名称
 *
 *  @return 星星视图
 */
- (UIView *)buidlStarViewWithImageName:(NSString *)imageName isForegroundColor:(BOOL)isForegroundColor
{
    CGRect frame = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.clipsToBounds = YES;
    for (int i = 0; i < self.numberOfStar; i ++)
    {
        UIImageView *imageView;
        if (isForegroundColor) {
            imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithGradientTintColor:self.foregroundViewColor]];
        }else
        {
            imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithGradientTintColor:self.backgroundViewColor]];
        }
        
        imageView.frame = CGRectMake(i * frame.size.width / self.numberOfStar, 0, frame.size.width / self.numberOfStar, frame.size.height);
        [view addSubview:imageView];
        if (isForegroundColor) {
            [self.foregroundImageViewArray addObject:imageView];
        }else
        {
            [self.backgroundImageViewArray addObject:imageView];
        }
    }
    return view;
}

#pragma mark -
#pragma mark - Change Star Foreground With Point

/**
 *  通过坐标改变前景视图
 *
 *  @param point 坐标
 */
- (void)changeStarForegroundViewWithPoint:(CGPoint)point
{
    CGPoint p = point;
    
    if (p.x < 0)
    {
        p.x = 0;
    }
    
    if (p.x > self.frame.size.width)
    {
        p.x = self.frame.size.width;
    }
    
    NSString * str = [NSString stringWithFormat:@"%0.2f",p.x / self.frame.size.width];
    float score = [str floatValue];
    p.x = score * self.frame.size.width;
    self.starForegroundView.frame = CGRectMake(0, 0, p.x, self.frame.size.height);
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(starRatingView: score:)])
    {
        [self.delegate starRatingView:self score:score];
    }
}

#pragma mark - KVO

- (void)registerForKVO {
    for (NSString *keyPath in [self observableKeypaths]) {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (void)unregisterFromKVO {
    for (NSString *keyPath in [self observableKeypaths]) {
        [self removeObserver:self forKeyPath:keyPath];
    }
}

- (NSArray *)observableKeypaths {
    return [NSArray arrayWithObjects:@"foregroundViewColor", @"backgroundViewColor", @"foregroundImageName", @"backgroundImageName", nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (![NSThread isMainThread]) {
        [self performSelectorOnMainThread:@selector(updateUIForKeypath:) withObject:keyPath waitUntilDone:NO];
    } else {
        [self updateUIForKeypath:keyPath];
    }
}

- (void)updateUIForKeypath:(NSString *)keyPath {
    if ([keyPath isEqualToString:@"foregroundViewColor"] ) {
        for (NSInteger i = 0; i < [self.foregroundImageViewArray count]; i++) {
            UIImageView *imageView = self.foregroundImageViewArray[i];
            imageView.image = [imageView.image imageWithGradientTintColor:self.foregroundViewColor];
        }
    } else if ([keyPath isEqualToString:@"backgroundViewColor"]) {
        for (NSInteger i = 0; i < [self.backgroundImageViewArray count]; i++) {
            UIImageView *imageView = self.backgroundImageViewArray[i];
            imageView.image = [imageView.image imageWithGradientTintColor:self.backgroundViewColor];
        }
    } else if ([keyPath isEqualToString:@"foregroundImageName"]) {
        for (NSInteger i = 0; i < [self.foregroundImageViewArray count]; i++) {
            UIImageView *imageView = self.foregroundImageViewArray[i];
            imageView.image = [[UIImage imageNamed:self.foregroundImageName] imageWithGradientTintColor:self.foregroundViewColor];
        }
    } else if ([keyPath isEqualToString:@"backgroundImageName"]) {
        for (NSInteger i = 0; i < [self.backgroundImageViewArray count]; i++) {
            UIImageView *imageView = self.backgroundImageViewArray[i];
            imageView.image = [[UIImage imageNamed:self.backgroundImageName] imageWithGradientTintColor:self.backgroundViewColor];
        }
    }
    [self setNeedsLayout];
    [self setNeedsDisplay];
}



@end
