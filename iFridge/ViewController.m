//
//  ViewController.m
//  iFridge
//
//  Created by Alexey Pelekh on 5/10/15.
//  Copyright (c) 2015 Alexey Pelekh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:@"https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQIcWX3a-DhojtwcC6gYIhvJl152QUiNKFVTN2Wl6cpMQYpV8zJyDoWot1G" ] options:SDWebImageDownloaderLowPriority progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
