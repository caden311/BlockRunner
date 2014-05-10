//
//  blockRow.m
//  BlockRunner
//
//  Created by Brittny Wright on 5/9/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import "blockRow.h"

@implementation blockRow




-(void)addBlockToArray:(UIImageView*) newBlock
{
    [Blocks insertObject:newBlock atIndex:numOfBlocks];
    numOfBlocks+=1;
}


-(void)setXSpeed:(NSInteger*) newSpeed
{
    xSpeed=*newSpeed;
}
-(void)setYSpeed:(NSInteger*) newSpeed
{
    ySpeed=*newSpeed;
}
-(void)setDirection:(bool) val;
{
    goingUp=val;
}

-(void)singleUpBlock
{
    int rand=arc4random()%2;
    int randHeight=50+(arc4random()%100);
    if(rand<1)
    {
      
        [self setDirection:YES];
        UIImageView * block=[[UIImageView alloc] initWithFrame:CGRectMake((lengthOfViewController-widthOfBlock),randHeight,widthOfBlock,heightOfTallBlock)];
        block.image=[UIImage imageNamed:@"dangerBlock.jpeg"];
        [self addBlockToArray:block];
    }
    else
    {
        
        
        [self setDirection:YES];
        UIImageView * block=[[UIImageView alloc] initWithFrame:CGRectMake((lengthOfViewController-widthOfBlock),randHeight,widthOfBlock,heightOfSmallBlock)];
        block.image=[UIImage imageNamed:@"dangerBlock.jpeg"];
        [self addBlockToArray:block];
        
        
    }
}
-(void)updateRow
{
    
    
    for(int i=0; i<[Blocks count]; i++)
    {
        
        UIImageView *temp=Blocks[i];
        //if block reaches top, takes it to bottom
        if(temp.frame.origin.y<(temp.frame.size.height*-1))
        {
            temp.frame=CGRectMake(temp.frame.origin.x, (widthOfViewController), temp.frame.size.width, temp.frame.size.height);
        }
        //if block reaches bottom, takes it to the top
        if(temp.frame.origin.y>(widthOfViewController))
        {
            temp.frame=CGRectMake(temp.frame.origin.x, (temp.frame.size.height*-1), temp.frame.size.width, temp.frame.size.height);
        }
        
        //decides if block is going up or down.
        if(goingUp==YES)
        {
        temp.center=CGPointMake(temp.center.x-xSpeed, temp.center.y-ySpeed);
        }
        else
        {
        temp.center=CGPointMake(temp.center.x-xSpeed, temp.center.y+ySpeed);
        }
    }
}

-(int)getXLocation
{
    UIImageView *temp=Blocks[0];
    return (temp.frame.origin.x);
    
}
-(NSInteger)getNumOfBlocks
{
    return numOfBlocks;
}
-(NSInteger)getXSpeed
{
    return xSpeed;
}
-(NSInteger)getYSpeed
{
    return ySpeed;
}
-(bool)getDirection
{
    return goingUp;
}

-(UIImageView*)getBlockAtIndex:(int)index
{
    return Blocks[index];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        Blocks=[[NSMutableArray alloc]init];
        numOfBlocks=0;
        xSpeed=.75;
        ySpeed=2;
        goingUp=YES;
        lengthOfViewController=568;
        widthOfViewController=320;
        widthOfBlock=84;
        heightOfSmallBlock=84;
        heightOfTallBlock=180;
        
    }
    return self;
}

@end
