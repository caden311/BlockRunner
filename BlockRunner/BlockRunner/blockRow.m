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
    [self setSpeed:&newSpeed1];
    [self setDirection:YES];
    UIImageView * block=[[UIImageView alloc] initWithFrame:CGRectMake(150, 150, 75, 200)];
    block.image=[UIImage imageNamed:@"dangerBloc.jpeg"];
    [self addBlockToArray:block];
    
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
        
    }
    return self;
}

@end
