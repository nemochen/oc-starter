//
//  MainViewController.m
//  starter
//
//  Created by chenbin on 2019/8/6.
//  Copyright © 2019 nemo. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tabBarController.tabBar setHidden:NO];
}

- (IBAction)onShowDetailBtnClick:(id)sender {
    [self.navigationController pushViewController:STORYBOARD_CONTROLLER(@"DetailViewController") animated:YES];
}

- (IBAction)onSignInBtnClick:(id)sender {
    [self.navigationController presentViewController:STORYBOARD_CONTROLLER(@"SignInViewController") animated:YES completion:nil];
}


@end
