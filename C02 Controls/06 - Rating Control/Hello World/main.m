/*
 
 Erica Sadun, http://ericasadun.com
 iOS 7 Cookbook
 Use at your own risk. Do no harm.
 
 */

@import UIKit;
@import QuartzCore;
#import "Utility.h"
#import "StarSlider.h"


#pragma mark - TestBedViewController

@interface TestBedViewController : UIViewController
@end

@implementation TestBedViewController
{
    StarSlider * slider;
}

- (void)loadView
{
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    slider = [StarSlider new];
    [slider addTarget:self action:@selector(handleStarSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    PREPCONSTRAINTS(slider);
    CENTER_VIEW(self.view, slider);
}

- (void)handleStarSliderChanged:(StarSlider *)starSlider
{
    self.title = [NSString stringWithFormat:@"%d Stars", starSlider.value];
}

@end


#pragma mark - Application Setup

@interface TestBedAppDelegate : NSObject <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow *window;
@end

@implementation TestBedAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.tintColor = COOKBOOK_PURPLE_COLOR;
    TestBedViewController *tbvc = [[TestBedViewController alloc] init];
    tbvc.edgesForExtendedLayout = UIRectEdgeNone;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tbvc];
    _window.rootViewController = nav;
    [_window makeKeyAndVisible];
    return YES;
}

@end


#pragma mark - main

int main(int argc, char *argv[])
{
    @autoreleasepool
    {
        int retVal = UIApplicationMain(argc, argv, nil, @"TestBedAppDelegate");
        return retVal;
    }
}
