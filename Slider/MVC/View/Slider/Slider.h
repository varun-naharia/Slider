//
//  Slider.h
//  Slider
//
//  Created by Varun Naharia on 29/12/16.
//  Copyright © 2016 TechWizard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Slider : UIView<UIScrollViewDelegate>

@property (nonatomic, strong) Slider *customView;
@property (weak, nonatomic) IBOutlet UIScrollView *slider;
@property (weak, nonatomic) IBOutlet UIPageControl *pagger;
@property (nonatomic, strong) NSMutableArray *slides;
-(void)setupSliderView;


@end
