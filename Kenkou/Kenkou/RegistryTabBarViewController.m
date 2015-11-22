//
//  RegistryTabBarViewController.m
//  Kenkou
//
//  Created by Alejandro Zamudio Guajardo on 11/19/15.
//  Copyright © 2015 Lazuli Labs. All rights reserved.
//

#import "RegistryTabBarViewController.h"

@interface RegistryTabBarViewController ()

@end

@implementation RegistryTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStylePlain target:self action:nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    /*CASE*/
//    if (
//        item.tag == 0
//        )
//    {
//        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStylePlain target:self action:nil]];
//    }
//    else if (
//        item.tag == 2
//        )
//    {
//        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"info"] style:UIBarButtonItemStylePlain target:self action:nil]];
//    }
//    else
//    {
//        [self.navigationItem setRightBarButtonItem:nil];
//    }
//    /*END-CASE*/
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

@end
