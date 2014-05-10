//
//  ViewController.h
//  BlockRunner
//
//  Created by Brittny Wright on 5/9/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//
#include "blockRow.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //button Variables
    bool goRight;
    bool goLeft;
    bool leftPressed;
    bool rightPressed;
    
    
    
    //timers
    NSTimer * playerMovement;
}




//Buttons
- (IBAction)touchUpLeft:(id)sender;
- (IBAction)touchDownLeft:(id)sender;
- (IBAction)touchUpRight:(id)sender;
- (IBAction)touchDownRight:(id)sender;



@property (weak, nonatomic) IBOutlet UIImageView *Player;

@end
