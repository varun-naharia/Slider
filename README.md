# Slider
Image Slider with xib
<br>

<div align="center">
        <img width="45%" src="Simulator%20Screen%20Shot%2030-Dec-2016%2C%2010.06.52%20AM.png?raw=true" alt="About screen" title="Slider"</img>
        <img height="0" width="8px">
        <img width="45%" src="Simulator%20Screen%20Shot%2030-Dec-2016%2C%2010.32.04%20AM.png" alt="List screen" title="slider"></img>
</div>

<H3>How to use</H3>
In .h file 
<pre>
#import "Slider.h"
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet Slider *slider;

@end
</pre>

In .m File
<pre>
    NSMutableArray *data = [[NSMutableArray alloc] init];
    [data addObject:@"http://www.planwallpaper.com/static/images/Nature-Background-Wallpapers-8_gxwmqmj.jpg"];
    [data addObject:@"http://wallpapercave.com/wp/eas6Et3.jpg"];
    [data addObject:@"https://images.freecreatives.com/wp-content/uploads/2015/06/beautiful-nature-background.jpg"];
    [data addObject:@"http://hdwallpaperbackgrounds.net/wp-content/uploads/2016/07/Nature-background-12.jpg"];
    slider.slides = data;
    [slider setupSliderView];
</pre>
