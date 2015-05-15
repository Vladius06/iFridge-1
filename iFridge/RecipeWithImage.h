//
//  RecipeWithImage.h
//  iFridge
//
//  Created by Alexey Pelekh on 5/15/15.
//  Copyright (c) 2015 Alexey Pelekh. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/SDWebImageDownloader.h>
#import <SDWebImage/SDWebImageManager.h>

@interface RecipeWithImage : ViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageForDish;
@property (strong, nonatomic) IBOutlet UITextView *textViewForRecipe;
@property (strong, nonatomic) NSString * imageLink;
@property (strong, nonatomic) NSMutableDictionary * ingredientsLines;

@end
