//
//  HUDViewController.m
//  LionsAndTigers
//
//  Created by Amaeya Kalke on 10/12/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "HUDViewController.h"

@interface HUDViewController ()

@end

@implementation HUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLionsButton:(id)sender {
    NSLog(@"Lions Button Tapped");
    [self.delegate lionsButtonTapped];
}


- (IBAction)onTigersButton:(id)sender {
    NSLog(@"Tigers Button Tapped");
    [self.delegate tigersButtonTapped];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
