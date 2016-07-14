# GYHPhotoLoadingView
整合了市面上主流app的图片加载指示器，环形加载，扇形加载，仿qq，微信，微博图片加载指示器

![GIF](https://raw.githubusercontent.com/gaoyuhang/GYHPhotoLoadingView/master/photo/testgif.gif)

##Usage
    progressV = [[GYHCircleProgressView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 40)/2,(SCREEN_HEIGHT - 40)/2, 40, 40)];
    progressV.progressColor = [UIColor redColor];
    progressV.progressStrokeWidth = 3.0f;
    progressV.progressTrackColor = [UIColor whiteColor];
    [self.view addSubview:progressV];
    
    __weak __typeof__(self) block_self = self;
    [self.imgV sd_setImageWithURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/gaoyuhang/DayDayNews/master/photo/newsfresh.png"] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        CGFloat progress = fabs(receivedSize/((CGFloat)expectedSize));
        [block_self animate:progress];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error) {
            NSLog(@"此处应该弹框提示,并且隐藏progressV");
        }
        progressV.hidden = YES;
    }];

