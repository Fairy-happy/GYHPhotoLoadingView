//
//  GYHSectorProgressView.m
//  GYHPhotoLoadingView
//
//  Created by 范英强 on 16/7/13.
//  Copyright © 2016年 gyh. All rights reserved.
//

#import "GYHSectorProgressView.h"

@interface GYHSectorProgressView()
{
    CAShapeLayer *backGroundLayer;      //背景图层
    CAShapeLayer *frontFillLayer;       //用来填充的图层
    UIBezierPath *backGroundBezierPath; //背景贝赛尔曲线
    UIBezierPath *frontFillBezierPath;  //用来填充的贝赛尔曲线
}
@end

@implementation GYHSectorProgressView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUp];
        
    }
    return self;
    
}
/**
 *  初始化创建图层
 */
- (void)setUp
{
    //创建背景图层
    backGroundLayer = [CAShapeLayer layer];
    backGroundLayer.fillColor = nil;
    backGroundLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    //创建填充图层
    frontFillLayer = [CAShapeLayer layer];
    frontFillLayer.fillColor = nil;
    frontFillLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithArcCenter:CGPointZero radius:25 startAngle:0 endAngle:M_PI*2 clockwise:YES].CGPath;
    border.frame = CGRectMake(11, 11, self.frame.size.width, self.frame.size.height);
    border.lineWidth = 1.5f;
    
    [self.layer addSublayer:border];
    [self.layer addSublayer:backGroundLayer];
    [self.layer addSublayer:frontFillLayer];
}

- (void)setProgressColor:(UIColor *)progressColor
{
    frontFillLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgressTrackColor:(UIColor *)progressTrackColor
{
    backGroundLayer.strokeColor = progressTrackColor.CGColor;
    backGroundBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width - self.frame.size.width/2, self.frame.size.width - self.frame.size.height/2) radius:self.frame.size.width/2.f startAngle:0 endAngle:M_PI*2 clockwise:YES];
    backGroundLayer.path = backGroundBezierPath.CGPath;
}

- (void)setProgressValue:(CGFloat)progressValue
{
    frontFillBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width - self.frame.size.width/2, self.frame.size.width - self.frame.size.height/2) radius:self.frame.size.width/2.f startAngle:-M_PI_2 endAngle:-M_PI_2 + progressValue * M_PI * 2 clockwise:YES];
    frontFillLayer.path = frontFillBezierPath.CGPath;
}

- (void)setProgressStrokeWidth:(CGFloat)progressStrokeWidth
{
    frontFillLayer.lineWidth = progressStrokeWidth;
    backGroundLayer.lineWidth = progressStrokeWidth;
}

@end
