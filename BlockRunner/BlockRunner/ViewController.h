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
    //mapping variables
    int lengthOfViewController;
    int widthOfViewController;
    int widthOfBlock;
    int heightOfSmallBlock;
    int heightOfTallBlock;
    //button Variables
    bool goRight;
    bool goLeft;
    bool leftPressed;
    bool rightPressed;
    
    
    //speed
    int speedOfBlocks;
    
    
    //arrayOfRows
    NSMutableArray * rowArray;
    
    //timers
    NSTimer * playerMovement;
}



@property (strong, nonatomic) IBOutlet UIView *myView;

//Buttons
- (IBAction)touchUpLeft:(id)sender;
- (IBAction)touchDownLeft:(id)sender;
- (IBAction)touchUpRight:(id)sender;
- (IBAction)touchDownRight:(id)sender;



@property (weak, nonatomic) IBOutlet UIImageView *Player;

@end
