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


-(void)setSpeed:(NSInteger*) newSpeed
{
    speed=*newSpeed;
}
-(void)setDirection:(bool) val;
{
    goingUp=val;
}

-(void)singleUpBlock: (int) newSpeed1
{
    int rand=arc4random()%2;
    int randHeight=50+(arc4random()%100);
    if(rand<1)
    {
        [self setSpeed:&newSpeed1];
        [self setDirection:YES];
        UIImageView * block=[[UIImageView alloc] initWithFrame:CGRectMake((lengthOfViewController-widthOfBlock),randHeight,widthOfBlock,heightOfTallBlock)];
        block.image=[UIImage imageNamed:@"dangerBlock.jpeg"];
        [self addBlockToArray:block];
    }
    else
    {
        
        [self setSpeed:&newSpeed1];
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
        temp.center=CGPointMake(temp.center.x-speed, temp.center.y);
    }
}

-(NSInteger)getNumOfBlocks
{
    return numOfBlocks;
}
-(NSInteger)getSpeed
{
    return speed;
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
        speed=2;
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
