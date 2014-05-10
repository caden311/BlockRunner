//
//  blockRow.h
//  BlockRunner
//
//  Created by Brittny Wright on 5/9/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface blockRow : NSObject
{
    int numOfBlocks;
    int speed;
    NSMutableArray *Blocks;
    //direction
    bool goingUp;
    
    
    //viewcontroller
    int lengthOfViewController;
    int widthOfViewController;
    int widthOfBlock;
    int heightOfSmallBlock;
    int heightOfTallBlock;
    
}


-(void)updateRow;
-(UIImageView*)getBlockAtIndex:(int)index;
-(NSInteger)getNumOfBlocks;
-(NSInteger)getSpeed;
-(bool)getDirection;
-(void)setSpeed:(NSInteger*)newSpeed;
-(void)setDirection:(bool)Dir;
-(void)singleUpBlock:(int) newSpeed1;
-(void)addBlockToArray:(UIImageView*)newImage;



@end
