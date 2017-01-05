//
//  Slider.m
//  Slider
//
//  Created by Varun Naharia on 29/12/16.
//  Copyright © 2016 TechWizard. All rights reserved.
//

#import "Slider.h"
#import "UIImageView+WebCache.h"


@implementation Slider
@synthesize pagger,slider,slides;
- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        
        [self initialize];
    }
    return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}

- (void)prepareForInterfaceBuilder{
    [self initialize];
}

- (instancetype)init
{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    // 1. Load the .xib file .xib file must match classname
    NSString *className = NSStringFromClass([self class]);
    _customView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
    _customView.frame = self.bounds;
    // 2. Set the bounds if not set by programmer (i.e. init called)
    //    if(CGRectIsEmpty(frame)) {
    //        self.bounds = _customView.bounds;
    //    }
    
    // 3. Add as a subview
    [self addSubview:_customView];
    //    pagger.hidden = YES;
    /*slides = [[NSMutableArray alloc] init];
     [slides addObject:@"http://www.planwallpaper.com/static/images/Nature-Background-Wallpapers-8_gxwmqmj.jpg"];
     [slides addObject:@"http://wallpapercave.com/wp/eas6Et3.jpg"];
     [slides addObject:@"https://images.freecreatives.com/wp-content/uploads/2015/06/beautiful-nature-background.jpg"];
     [slides addObject:@"http://hdwallpaperbackgrounds.net/wp-content/uploads/2016/07/Nature-background-12.jpg"];
     [self setupSliderView];*/
    pagger.currentPage = 1;
    //    pagger.currentPageIndicatorTintColor = [UIColor redColor];
    //    pagger.pageIndicatorTintColor = [UIColor colorWithRed:0.137 green:0.651 blue:0.510 alpha:1.00];
    
}

-(void)setupSliderView
{
    //    pagger.alpha = 0;
    slider.pagingEnabled = YES;
    slider.delegate = self;
    pagger.numberOfPages = slides.count;
    //pagger.backgroundColor = [UIColor blueColor];
    for (UIView *view in slider.subviews) {
        if([view isKindOfClass:[UIImageView class]])
        {
            [view removeFromSuperview];
        }
    }
    int i = 0;
    for (NSString *str in slides) {
        UIImageView *imageView = [[UIImageView alloc] init];
        //imageView.backgroundColor = [UIColor blueColor];
        [imageView sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"Property"]];
        imageView.frame = CGRectMake(slider.frame.size.width*i, 0, slider.frame.size.width, slider.frame.size.height);
        //imageView.backgroundColor = [[UIColor alloc] initWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0 blue:arc4random()%256/256.0 alpha:1.0];
        [slider addSubview:imageView];
        i++;
    }
    slider.contentSize = CGSizeMake(slider.frame.size.width * slides.count, slider.frame.size.height);
    //    [self addSubview:slider];
    [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(autoStartSlide:) userInfo:nil repeats:YES];
    [self setNeedsLayout];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    slider.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    int i =0 ;
    for (UIView *view in slider.subviews) {
        if([view isKindOfClass:[UIImageView class]])
        {
            view.frame = CGRectMake(slider.frame.size.width*i, 0, slider.frame.size.width, slider.frame.size.height);
            i++;
        }
    }
    slider.contentSize = CGSizeMake(slider.frame.size.width * slides.count, slider.frame.size.height);
    //    pagger.frame = CGRectMake(self.frame.size.width-((self.frame.size.width*0.25)+15), self.frame.size.height-40, self.frame.size.width*0.25, 30);
    [self bringSubviewToFront:pagger];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = slider.contentOffset.x / slider.frame.size.width;
    pagger.currentPage = page;
}

-(void)autoStartSlide:(id)sender
{
    if(pagger.numberOfPages > pagger.currentPage+1)
    {
        [UIView animateWithDuration:0.5 animations:^{
            slider.contentOffset = CGPointMake(slider.contentOffset.x + slider.frame.size.width, 0);
        } completion:^(BOOL finished) {
            //sliderScrollView.contentOffset = CGPointMake(sliderScrollView.contentOffset.x + sliderScrollView.frame.size.width, 0);
        }];
        
    }
    else
    {
        slider.contentOffset = CGPointMake(slider.contentOffset.x - slider.frame.size.width, 0);
        [UIView animateWithDuration:0.5 animations:^{
            slider.contentOffset = CGPointMake(slider.contentOffset.x + slider.frame.size.width, 0);
        } completion:^(BOOL finished) {
            slider.contentOffset = CGPointMake(0, 0) ;
        }];
        
    }
}

@end
