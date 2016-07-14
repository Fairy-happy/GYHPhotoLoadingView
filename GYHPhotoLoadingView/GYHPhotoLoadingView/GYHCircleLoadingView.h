//
//  GYHCircleLoadingView.h
//  GYHPhotoLoadingView
//
//  Created by 范英强 on 16/7/13.
//  Copyright © 2016年 gyh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GYHCircleLoadingView : UIView

- (id)initWithViewFrame:(CGRect)frame;
- (id)initWithViewFrame:(CGRect)frame tintColor:(UIColor *)tintColor size:(CGFloat)size lineWidth:(CGFloat)lineWidth;

@property (nonatomic) CGFloat                 progress;
@property (nonatomic, readonly) BOOL          animating;

- (void)startAnimating;
- (void)stopAnimating;

@end
