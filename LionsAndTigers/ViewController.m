//
//  ViewController.m
//  LionsAndTigers
//
//  Created by Amaeya Kalke on 10/12/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <TopDelegate, HUDDelegate, UICollectionViewDelegate, UICollisionBehaviorDelegate>

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftConstraint;
@property (strong, nonatomic) TopViewController *topViewController;

@property UICollisionBehavior *collisionBehavior;
@property UIDynamicItemBehavior *dynamicItemBehavior;
@property UIGravityBehavior *gravityBehavior;
@property UIPushBehavior *pushBehavior;
@property UIDynamicAnimator *dynamicAnimator;
@property (strong, nonatomic) IBOutlet UIView *topContainerView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    //Set up animation
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:[NSArray arrayWithObject: self.topViewController]];
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:[NSArray arrayWithObject: self.topViewController]];
    self.dynamicItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:[NSArray arrayWithObject:self.topViewController]];
    self.pushBehavior = [[UIPushBehavior alloc] initWithItems:[NSArray arrayWithObject:self.topViewController] mode:UIPushBehaviorModeContinuous];

    //Define collision boundary
    [self.collisionBehavior addBoundaryWithIdentifier:@"left" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(0, self.view.frame.size.height)];

    self.collisionBehavior.collisionDelegate = self;
    [self.gravityBehavior setGravityDirection:CGVectorMake(0, 0)];

     [self.dynamicAnimator addBehavior:self.collisionBehavior];
     [self.dynamicAnimator addBehavior:self.gravityBehavior];
     [self.dynamicAnimator addBehavior:self.pushBehavior];
     [self.dynamicAnimator addBehavior:self.dynamicItemBehavior];

}

#pragma side navigation

-(void)topRevealButtonTapped{
    NSLog(@"Reveal button delegate working");
//    [self.gravityBehavior setGravityDirection:CGVectorMake(0, 1)];
//    [self.pushBehavior setPushDirection:CGVectorMake(0,1)];

    //set animation behavior
//    if(self.leftConstraint.constant == 0){
//        self.leftConstraint.constant = 80.0;
//    }
//    else if(self.leftConstraint.constant == 80){
//        self.leftConstraint.constant = 0;
//    }
}

-(void)lionsButtonTapped{
    NSLog(@"Lion delegate working!");
    [self.topViewController lionButtonPressed];

    //set animation behavior
//    [self.gravityBehavior setGravityDirection:CGVectorMake(0, 1)];
//    [self.pushBehavior setPushDirection:CGVectorMake(0,1)];
    
}

-(void)tigersButtonTapped{
    NSLog(@"Tiger delegate working!");
    [self.topViewController tigerButtonPressed];

    //set animation behavior
//    [self.gravityBehavior setGravityDirection:CGVectorMake(0, 1)];
//    [self.pushBehavior setPushDirection:CGVectorMake(0,1)];
}


#pragma segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    //Select appropriate segue depending since two views are visible
    if([segue.identifier isEqualToString:@"segueTOP"]){
        UINavigationController *navController = segue.destinationViewController;
        self.topViewController = (TopViewController *)navController.topViewController;
        self.topViewController.delegate = self;
    }
    else {
        HUDViewController *hudViewController = segue.destinationViewController;
        hudViewController.delegate = self;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
