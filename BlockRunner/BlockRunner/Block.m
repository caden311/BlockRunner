//
//  Block.m
//  BlockRunner
//
//  Created by Brittny Wright on 5/13/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import "Block.h"

@implementation Block


-(float)getXSpeed
{
    return xSpeed;
}
-(float)getYSpeed
{
    return ySpeed;
}
-(void)setXSpeed:(float)newSpeed
{
    xSpeed=newSpeed;
}
-(void)setYSpeed:(float)newSpeed
{
    ySpeed=newSpeed;
}
-(void)upDateBlock
{
  

        //if block reaches top, takes it to bottom
        if(block.frame.origin.y<(block.frame.size.height*-1))
        {
            block.frame=CGRectMake(block.frame.origin.x, (widthOfViewController), block.frame.size.width, block.frame.size.height);
        }
        //if block reaches bottom, takes it to the top
        if(block.frame.origin.y>(widthOfViewController))
        {
            block.frame=CGRectMake(block.frame.origin.x, (block.frame.size.height*-1), block.frame.size.width, block.frame.size.height);
        }
        
        //decides if block is going up or down.
        
        block.center=CGPointMake(block.center.x-xSpeed, block.center.y+ySpeed);
        
    
}

-(void)setUpBlock
{
    
    int randBlockHeight=35+arc4random()%100;
    int randHeight=50+(arc4random()%100);
    float randSpeed=1+(.10*(arc4random()%11));
    block=[[UIImageView alloc] initWithFrame:CGRectMake((lengthOfViewController-widthOfBlock),randHeight,widthOfBlock,randBlockHeight)];
    block.image=[UIImage imageNamed:@"dangerBlock.jpeg"];
    [self setYSpeed:randSpeed];
}


-(UIImageView*)getBlockImage
{
    return block;
}

-(void)setYLocation:(int)yLoc;
{
    block.frame=CGRectMake(block.frame.origin.x, yLoc, block.frame.size.width, block.frame.size.height);
}

-(int)getXLocation
{
    return (block.frame.origin.x);
}
-(int)getYLocation
{
    return block.frame.origin.y;
}

-(int)getBlockHeight
{
    return block.frame.size.height;
    
}
-(int)getBlockWidth
{
    return block.frame.size.width;
}
-(void)setBlockHeight:(int)height
{
   block.frame=CGRectMake(block.frame.origin.x, block.frame.origin.y, block.frame.size.width, height);
}
-(void)setBlockWidth:(int)width
{
    block.frame=CGRectMake(block.frame.origin.x, block.frame.origin.y, width, block.frame.size.height);
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        xSpeed=.75;
        ySpeed=2;
     
        lengthOfViewController=568;
        widthOfViewController=320;
        widthOfBlock=68;
        heightOfSmallBlock=84;
        heightOfTallBlock=180;
        
        
    }
    return self;
}
@end
