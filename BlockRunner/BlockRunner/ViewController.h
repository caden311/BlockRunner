//
//  ViewController.h
//  BlockRunner
//
//  Created by Brittny Wright on 5/9/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#include "Block.h"
#include "dataBase.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    //score variables
    int score;
    
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
    //collisions
    NSMutableArray *collisionOppositeBlocksArray;
    NSMutableArray *collisionObjectsArray;
    NSMutableArray *rowSpeedArray;
    //arrayOfRows
    NSMutableArray * rowArray;
    
    //timers
    NSTimer * playerMovement;
    NSTimer *gameTimer;
}
@property (strong, nonatomic) dataBase * db;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;



@property (strong, nonatomic) IBOutlet UIView *myView;

//Buttons
- (IBAction)touchUpLeft:(id)sender;
- (IBAction)touchDownLeft:(id)sender;
- (IBAction)touchUpRight:(id)sender;
- (IBAction)touchDownRight:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *goButton;
- (IBAction)goButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *Player;


@end
