//
//  RecipeWithImage.m
//  iFridge
//
//  Created by Alexey Pelekh on 5/15/15.
//  Copyright (c) 2015 Alexey Pelekh. All rights reserved.
//

#import "RecipeWithImage.h"


@interface RecipeWithImage ()

@end

@implementation RecipeWithImage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"JSON: %@", self.imageLink);
    NSLog(@"JSON: %@", self.ingredientsLines);
    
    self.textViewForRecipe.text = [NSString stringWithFormat:@"%@", _ingredientsLines];
        [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:_imageLink] options:SDWebImageDownloaderLowPriority progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            [self.imageForDish setBackgroundColor:[UIColor colorWithPatternImage:image]];
        }];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
