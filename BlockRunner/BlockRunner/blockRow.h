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
    float xSpeed;
    float ySpeed;
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


-(int)getXLocation;
-(void)updateRow;
-(UIImageView*)getBlockAtIndex:(int)index;
-(NSInteger)getNumOfBlocks;
-(NSInteger)getXSpeed;
-(NSInteger)getYSpeed;
-(bool)getDirection;
-(void)setXSpeed:(NSInteger*)newSpeed;
-(void)setYSpeed:(NSInteger*)newSpeed;
-(void)setDirection:(bool)Dir;
-(void)singleUpBlock;
-(void)addBlockToArray:(UIImageView*)newImage;



@end
