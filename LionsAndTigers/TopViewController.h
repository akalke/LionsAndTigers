//
//  TopViewController.h
//  LionsAndTigers
//
//  Created by Amaeya Kalke on 10/12/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUDViewController.h"

@protocol TopDelegate <NSObject>

-(void)topRevealButtonTapped;

@end

@interface TopViewController : UIViewController
@property id<TopDelegate> delegate;

-(void)tigerButtonPressed;
-(void)lionButtonPressed;

@end
