//
//  Block.h
//  BlockRunner
//
//  Created by Brittny Wright on 5/13/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject
{
    float xSpeed;
    float ySpeed;
    
    //viewcontroller
    int lengthOfViewController;
    int widthOfViewController;
    int widthOfBlock;
    int heightOfSmallBlock;
    int heightOfTallBlock;
    
    UIImageView *block;
}

-(int)getXLocation;
-(int)getYLocation;
-(void)setYLocation:(int)yLoc;
-(int)getBlockHeight;
-(int)getBlockWidth;
-(void)setBlockHeight:(int)height;
-(void)setBlockWidth:(int)width;

-(UIImageView*)getBlockImage;
-(void)setUpBlock;

-(float)getXSpeed;
-(float)getYSpeed;
-(void)setXSpeed:(float)newSpeed;
-(void)setYSpeed:(float)newSpeed;
-(void)upDateBlock;
@end
