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
    
    
}

-(NSInteger)getNumOfBlocks;
-(NSInteger)getSpeed;
-(bool)getDirection;
-(void)setSpeed:(NSInteger*)newSpeed;
-(void)setDirection:(bool)Dir;
-(void)setUpRow1: (int) numBlocks: (int) newSpeed1: (bool *) direction;
-(void)addBlockToArray:(UIImage*)newImage;



@end
