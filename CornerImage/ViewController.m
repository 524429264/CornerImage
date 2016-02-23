//
//  ViewController.m
//  CornerImage
//
//  Created by NationSky on 16/2/23.
//  Copyright © 2016年 nsky. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CornerImage.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    [self test1];
    
    [self test2];
    
    [self test3];
}

- (void)test1
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 300, 200)];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
   
    imageView.image =  [image imageByRoundCornerRadius:200];
  
    [self.view addSubview:imageView];

}

- (void)test2
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 240, 300, 200)];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    imageView.image = image;
    imageView.layer.cornerRadius = 100;
    imageView.layer.masksToBounds = YES;
    
    [self.view addSubview:imageView];
}

- (void)test3
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 460, 300, 200)];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    image = [image roundedCornerImageWithCornerRadius:image.size.height/2.0];
    imageView.image = image;
    
    [self.view addSubview:imageView];
}




@end
