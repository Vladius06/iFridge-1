//
//  SearchViewController.m
//  iFridge
//
//  Created by Alexey Pelekh on 5/15/15.
//  Copyright (c) 2015 Alexey Pelekh. All rights reserved.
//

#import "SearchViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "VKSdk.h"

static NSString *const vkAppID = @"4921324";



@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    NSArray* vkPermissions = [NSArray arrayWithObjects: @"photos", @"friends", @"wall", @"audio", @"video", @"docs", @"notes", @"pages",
                        @"status", @"groups", @"messages",nil];
    
    
    [VKSdk initializeWithDelegate:self andAppId:vkAppID ];
    if ([VKSdk wakeUpSession])
    {
       [VKSdk authorize:vkPermissions revokeAccess:YES];
        
    }
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    
    loginButton.frame = CGRectMake(16, 72, loginButton.frame.size.width, loginButton.frame.size.height);
    
    [self.view addSubview:loginButton];
    

}

-(void) vkSdkReceivedNewToken:(VKAccessToken*) newToken{
    
}

-(void) vkSdkUserDeniedAccess:(VKError*) authorizationError {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



- (IBAction)searchButton:(id)sender {

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    RecipesTableViewController *newController = segue.destinationViewController;
    
    newController.myLink = [NSString stringWithString: self.searchTextField.text];
}

@end