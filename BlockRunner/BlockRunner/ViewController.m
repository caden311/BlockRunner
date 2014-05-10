//
//  ViewController.m
//  BlockRunner
//
//  Created by Brittny Wright on 5/9/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //button variables
    goRight=false;
    goLeft=false;
    leftPressed=false;
    rightPressed=false;
    
    rowArray=[[NSMutableArray alloc] init];
    
    speedOfBlocks=2;
    [self setUpRow];
    
   // NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:.09 target:self selector:@selector(movingBlocks) userInfo:nil repeats:YES];
  
    
}

-(void)setUpRow
{
    blockRow * row1=[[blockRow alloc] init];
    [row1 singleUpBlock:speedOfBlocks];
    UIImageView * temp=[row1 getBlockAtIndex:[row1 getNumOfBlocks]-1];
    [self.view addSubview:temp];
    [self.view sendSubviewToBack:temp];
    [rowArray addObject:temp];
    

}

-(void)movingBlocks
{
    
    for(int i=0; i<[rowArray count]; i++)
    {
        blockRow *temp=rowArray[i];
        [temp updateRow];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)moving
{
    if(leftPressed==true)
    {
        _Player.center=CGPointMake(_Player.center.x-5, _Player.center.y);
    }
    if(rightPressed==true)
    {
        _Player.center=CGPointMake(_Player.center.x+5, _Player.center.y);
    }
}


- (IBAction)touchDownLeft:(id)sender {
    goRight=false;
    leftPressed=true;
    if(rightPressed==false)
    {
        playerMovement=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moving) userInfo:Nil repeats:YES];
    }
}


- (IBAction)touchUpLeft:(id)sender {
    leftPressed=false;
    [playerMovement invalidate];
    
}


- (IBAction)touchUpRight:(id)sender {
    rightPressed=false;
    [playerMovement invalidate];
}

- (IBAction)touchDownRight:(id)sender {
    goRight=true;
    rightPressed=true;
    if(leftPressed==false)
    {
        playerMovement=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(moving) userInfo:Nil repeats:YES];
    }
}

@end
