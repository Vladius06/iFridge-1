//
//  SearchViewController.h
//  iFridge
//
//  Created by Alexey Pelekh on 5/15/15.
//  Copyright (c) 2015 Alexey Pelekh. All rights reserved.
//

#import "ViewController.h"
#import "RecipesTableViewController.h"
#import "VKSdk.h"

@interface SearchViewController : ViewController
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

- (IBAction)searchButton:(id)sender;

@end
