//
//  ViewController.m
//  ImageView处理成圆形
//
//  Created by 金晓浩 on 16/4/6.
//  Copyright © 2016年 jinxiaohao. All rights reserved.
//

#import "ViewController.h"
#import "MKDialogController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // imageView设置成圆形
    [self addView];
    

    
    MKDialogController *mkdc = [[MKDialogController alloc] init];
    mkdc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        mkdc.providesPresentationContextTransitionStyle = YES;
        mkdc.definesPresentationContext = YES;
        mkdc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
        [self.tabBarController presentViewController:mkdc animated:YES completion:nil];
    }
    else{
        self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentViewController:mkdc animated:NO completion:nil];
        self.view.window.rootViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    
    
}



- (void)addView{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.backgroundColor = [UIColor cyanColor];
    imageView.image = [self changeImageToRoundShape:[UIImage imageNamed:@"pic"]];
    [self.view addSubview:imageView];
    
#if 0
    UIImage * img = [UIImage imageNamed:@"pic"];
    img = [img imageWithRenderingMode:UIImageRenderingModeAutomatic];  // 设置UIImage的渲染模式
    UIImageView *imV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 205, 100, 100)];

    imV.image = img;
    [self.view addSubview:imV];
#endif
 
#if 1
    // 添加模糊效果
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = [UIScreen mainScreen].bounds;
    [imageView addSubview:effectView];
#endif
}

#pragma mark -  imageView设置成圆形
- (id)changeImageToRoundShape:(UIImage *)image{
    UIImage *finalImage = nil;
    UIGraphicsBeginImageContext(image.size);
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGAffineTransform transform = CGAffineTransformConcat(CGAffineTransformIdentity, CGAffineTransformMakeScale(1.0, -1.0));
        transform = CGAffineTransformConcat(transform, CGAffineTransformMakeTranslation(0.0, image.size.height));
        CGContextConcatCTM(ctx, transform);
        CGContextBeginPath(ctx);
        CGContextAddEllipseInRect(ctx, CGRectMake(0.0, 0.0, image.size.width, image.size.height));
        CGContextClip(ctx);
        CGContextDrawImage(ctx, CGRectMake(0.0, 0.0, image.size.width, image.size.height), image.CGImage);
        finalImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return finalImage;
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
