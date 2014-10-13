//
//  HUDViewController.h
//  LionsAndTigers
//
//  Created by Amaeya Kalke on 10/12/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HUDDelegate <NSObject>

-(void)tigersButtonTapped;
-(void)lionsButtonTapped;

@end

@interface HUDViewController : UIViewController
@property id<HUDDelegate> delegate;

@end
