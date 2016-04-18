//
//  ViewController.m
//  Lab6_2
//
//  Created by Admin on 11.04.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *indicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)refresh:(id)sender {
    NSURL *url = [[NSURL alloc] initWithString: @"https://query.yahooapis.com/v1/public/yql?q=select*%20from%20weather.forecast%20where%20woeid%3D834463&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"];
NSData *contents = [[NSData alloc] initWithContentsOfURL:url];
NSDictionary *forcasting = [NSJSONSerialization JSONObjectWithData:contents options:NSJSONReadingMutableContainers error:nil];


    NSDictionary* currentForecast = [[[[forcasting valueForKey:@"query"] valueForKey:@"results"]valueForKey:@"channel"]valueForKey:@"item"];
    
    NSString* lowTemperature = [[currentForecast valueForKey:@"forecast"][0] valueForKey:@"low"];
    NSString* highTemperature = [[currentForecast valueForKey:@"forecast"][0] valueForKey:@"high"];
    
    [self.indicator setText:lowTemperature];
    NSInteger temperature = [lowTemperature integerValue];
    temperature -= 32;
    temperature *= 5/9;
    
    if (temperature > 86)
        [self.indicator setTextColor:[UIColor redColor]];
    else
        if (temperature > 68)
            [self.indicator setTextColor:[UIColor orangeColor]];
        else
            if (temperature <= 68)
                [self.indicator setTextColor:[UIColor yellowColor]];
            else
                if (temperature < 32)
                    [self.indicator setTextColor:[UIColor blueColor]];
                else
                    if (temperature <= -4)
                        [self.indicator setTextColor:[UIColor cyanColor]];
}
@end
