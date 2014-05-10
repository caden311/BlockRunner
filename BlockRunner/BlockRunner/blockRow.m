//
//  blockRow.m
//  BlockRunner
//
//  Created by Brittny Wright on 5/9/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import "blockRow.h"

@implementation blockRow




-(void)addBlockToArray:(UIImage*) newBlock
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

-(void)setUpRow1: (int) numBlocks: (int) newSpeed1: (bool *) direction
{
    numOfBlocks=numBlocks;
    [self setSpeed:&newSpeed1];
    [self setDirection:direction];
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


- (instancetype)init
{
    self = [super init];
    if (self) {
        Blocks=[[NSMutableArray alloc]init];
        numOfBlocks=0;
        speed=2;
        goingUp=YES;
        
    }
    return self;
}

@end
