//
//  ViewController.m
//  Slider
//
//  Created by Varun Naharia on 29/12/16.
//  Copyright © 2016 TechWizard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *data;

@end

@implementation ViewController
@synthesize slider,data;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    data = [[NSMutableArray alloc] init];
    [data addObject:@"http://www.planwallpaper.com/static/images/Nature-Background-Wallpapers-8_gxwmqmj.jpg"];
    [data addObject:@"http://wallpapercave.com/wp/eas6Et3.jpg"];
    [data addObject:@"https://images.freecreatives.com/wp-content/uploads/2015/06/beautiful-nature-background.jpg"];
    [data addObject:@"http://hdwallpaperbackgrounds.net/wp-content/uploads/2016/07/Nature-background-12.jpg"];
    slider.slides = data;
    [slider setupSliderView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
