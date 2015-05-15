//
//  RecipesTableViewController.m
//  iFridge
//
//  Created by Alexey Pelekh on 5/14/15.
//  Copyright (c) 2015 Alexey Pelekh. All rights reserved.
//

#import "RecipesTableViewController.h"
#import "TableViewCellRecipes.h"


@interface RecipesTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation RecipesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.edamam.com/search?q=meat&app_id=098aa935&app_key=e6f6e485b0222cf1b48439a164562270" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.allRecipes = (NSDictionary *) responseObject;
        self.recipes = self.allRecipes[@"hits"];
       NSLog(@"JSON: %@", self.recipes);
//        self.name = self.allRecipes[@"orgTypes"];
//        
//        self.cookingTime = self.allRecipes[@"currencies"];
//       
//        self.calories = self.allRecipes[@"regions"];
//      
//        self.totalWeight = self.allRecipes[@"cities"];
//        
//        self.fat = self.allRecipes[@"orgTypes"];
//        
//        self.sugars = self.allRecipes[@"currencies"];
//        
//        self.cookingLevel = self.allRecipes[@"regions"];
//        //NSLog(@"JSON: %@", self.regions);

        [self.tableView reloadData];
        
        //NSLog(@"JSON: %@", self.post[0][@"address"]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   

   
   return self.recipes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecipesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    //        self.name = self.allRecipes[@"orgTypes"];
    //
    //        self.cookingTime = self.allRecipes[@"currencies"];
    //
    //        self.calories = self.allRecipes[@"regions"];
    //
    //        self.totalWeight = self.allRecipes[@"cities"];
    //
    //        self.fat = self.allRecipes[@"orgTypes"];
    //
    //        self.sugars = self.allRecipes[@"currencies"];
    //
    //        self.cookingLevel = self.allRecipes[@"regions"];
    //        //NSLog(@"JSON: %@", self.regions);

    cell.nameOfDish.text = self.recipes[indexPath.row][@"recipe"][@"label"];
    
    cell.cookingLevel.text = self.recipes[indexPath.row][@"recipe"][@"level"];
    
    cell.cookingTime.text = [NSString stringWithFormat:@"cookingTime: %@", self.recipes[indexPath.row][@"recipe"][@"cookingTime"]];
    
    double str1 = [self.recipes[indexPath.row][@"recipe"][@"calories"] doubleValue];
    NSString *caloriesTotal = [NSString stringWithFormat:@"calories: %2.3f", str1];
    cell.caloriesTotal.text = [NSString stringWithString:caloriesTotal];
    
    double str4 = [self.recipes[indexPath.row][@"recipe"][@"totalNutrients"][@"SUGAR"][@"quantity"] doubleValue];
    NSString *sugarsTotal = [NSString stringWithFormat:@"sugar: %2.3f", str4];
    cell.sugarsTotal.text = [NSString stringWithString:sugarsTotal];
//    cell.sugarsTotal.text = self.recipes[indexPath.row][@"recipe"][@"label"];
    
    double str3 = [self.recipes[indexPath.row][@"recipe"][@"totalWeight"] doubleValue];
    NSString *weightTotal = [NSString stringWithFormat:@"weight: %2.3f", str3];
    cell.weightTotal.text = [NSString stringWithString:weightTotal];

    
    double str2 = [self.recipes[indexPath.row][@"recipe"][@"totalNutrients"][@"FAT"][@"quantity"] doubleValue];
    NSString *fatTotal = [NSString stringWithFormat:@"fat: %2.3f", str2];
    cell.fatTotal.text = [NSString stringWithString:fatTotal];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
