//
//  ViewController.m
//  BlockRunner
//
//  Created by Brittny Wright on 5/9/14.
//  Copyright (c) 2014 vientapps. All rights reserved.
//

#import "ViewController.h"



@implementation ViewController
@synthesize db=_db;

- (void)viewDidLoad
{
     [super viewDidLoad];
    [self setUpGame];
   
    
  
  
    
}
-(void)setUpGame
{
    [self loadPlist];
    
    score=0;
   // _highScoreLabel.hidden=YES;
    lengthOfViewController=568;
    widthOfViewController=320;
    widthOfBlock=68;
    heightOfSmallBlock=84;
    heightOfTallBlock=180;
    goRight=false;
    goLeft=false;
    leftPressed=false;
    rightPressed=false;
    
    
   
    speedOfBlocks=2;
    
    [self setUpArrays];
    [self setUpLabels];
    

}
-(void)setUpArrays
{
    rowArray=[[NSMutableArray alloc] init];
    collisionObjectsArray=[[NSMutableArray alloc] init];
    collisionOppositeBlocksArray=[[NSMutableArray alloc]init];
    rowSpeedArray=[[NSMutableArray alloc]init];
}
-(void)setUpLabels
{
    NSMutableArray * sizeOfData=[_db getDB];
    if([sizeOfData count]>0)
    {
        NSString * val= [_db getUser:(0)];
        _highScoreLabel.text=val;
        
    }
    
}

-(void)oppositeCollisions
{
    for(int i=0; i<[collisionOppositeBlocksArray count]; i++)
    {
        Block * collisionObject1=collisionOppositeBlocksArray[i];
        UIImageView * collisionObject=[collisionObject1 getBlockImage];
        
        
         if(i!=[collisionOppositeBlocksArray count]-1)
         {
         Block *blockObject=collisionOppositeBlocksArray[i+1];
         UIImageView *block1=[blockObject getBlockImage];
         
         
             if(CGRectIntersectsRect(block1.frame, collisionObject.frame))
             {
                 float val=[collisionObject1 getYSpeed];
                 [collisionObject1 setYSpeed:(val*-1)];
                 float val1=[blockObject getYSpeed];
                 [blockObject setYSpeed:(val1*-1)];
             }
         }
        if(CGRectIntersectsRect(_Player.frame, collisionObject.frame))
        {
            if(_Player.center.y<collisionObject.center.y+(collisionObject.frame.size.height/2)&&_Player.center.y>collisionObject.center.y-(collisionObject.frame.size.height/2))
            {
   
                [self showScore];
                
            }
            
            _Player.center=CGPointMake(_Player.center.x, _Player.center.y+[collisionObject1 getYSpeed]);
        }

    
    }
 
}
-(void)collisions
{
    if(_Player.frame.origin.x<widthOfBlock||_Player.frame.origin.x>(lengthOfViewController-widthOfBlock-_Player.frame.size.width))
    {
         [self showScore];
    }
    if(_Player.frame.origin.y>widthOfViewController||_Player.frame.origin.y<0)
    {
         [self showScore];
    }
    
    
    
    for(int i=0; i<[collisionObjectsArray count]; i++)
    {
        Block * collisionObject1=collisionObjectsArray[i];
        UIImageView * collisionObject=[collisionObject1 getBlockImage];
        

        if(CGRectIntersectsRect(_Player.frame, collisionObject.frame))
        {
            if(_Player.center.y<collisionObject.center.y+(collisionObject.frame.size.height/2)&&_Player.center.y>collisionObject.center.y-(collisionObject.frame.size.height/2))
            {
              
              
                [self showScore];
                
            }
         
            _Player.center=CGPointMake(_Player.center.x, _Player.center.y+[collisionObject1 getYSpeed]);
         
            
         
        
        }
    }
    
}

-(void)setUpSingleBlockRow
{
     int randDirection=arc4random()%2;
    
    Block *block1=[[Block alloc] init];
    [block1 setUpBlock];
    if(randDirection<1)
    {
        float val=[block1 getYSpeed];
        [block1 setYSpeed:(val*-1)];
    }
    [self.view addSubview:[block1 getBlockImage]];
    [self.view sendSubviewToBack:[block1 getBlockImage]];
    [rowArray addObject:block1];
    [collisionObjectsArray addObject:block1];
   
    
}
-(void)setUpDoubleBlockRow
{  // int randHeight=100+arc4random()%100;
    int randDirection=arc4random()%2;
    
    Block *block1=[[Block alloc] init];
    Block *block2=[[Block alloc] init];
    [block1 setUpBlock];
    [block2 setUpBlock];
    [block2 setYLocation:(block1.getYLocation)+[block1 getBlockHeight]*2];
    
    if(randDirection<1)
    {
        float val=[block1 getYSpeed];
        [block1 setYSpeed:(val*-1)];
        [block2 setYSpeed:(val*-1)];
    }
    
    [self.view addSubview:[block1 getBlockImage]];
    [self.view sendSubviewToBack:[block1 getBlockImage]];
    
    [self.view addSubview:[block2 getBlockImage]];
    [self.view sendSubviewToBack:[block2 getBlockImage]];
    [rowArray addObject:block1];
    [collisionObjectsArray addObject:block1];
    [rowArray addObject:block2];
    [collisionObjectsArray addObject:block2];
}
-(void)setUpOppositeDoubleBlockRow
{   int randHeight=arc4random()%5;

    Block *block1=[[Block alloc] init];
    Block *block2=[[Block alloc] init];
    [block1 setUpBlock];
    [block2 setUpBlock];
    
    if(randHeight<1)
    {
        [block1 setBlockHeight:137];
        [block2 setBlockHeight:71];
        [block1 setYLocation:127];
        [block2 setYLocation:276];
    }
    else if(randHeight<3)
    {
        [block1 setBlockHeight:77];
        [block2 setBlockHeight:63];
        [block1 setYLocation:78];
        [block2 setYLocation:248];
    }
    else if(randHeight<5)
    {
        [block1 setBlockHeight:91];
        [block2 setBlockHeight:71];
        [block1 setYLocation:113];
        [block2 setYLocation:241];
    }
    
   
    

  
        float val=[block1 getYSpeed];
        [block1 setYSpeed:(val*-1)];
    
    
    
    [self.view addSubview:[block1 getBlockImage]];
    [self.view sendSubviewToBack:[block1 getBlockImage]];
    
    [self.view addSubview:[block2 getBlockImage]];
    [self.view sendSubviewToBack:[block2 getBlockImage]];
    [rowArray addObject:block1];
    [collisionOppositeBlocksArray addObject:block1];
    [rowArray addObject:block2];
    [collisionOppositeBlocksArray addObject:block2];
}

-(void)movingBlocks
{
    
    for(int i=0; i<[rowArray count]; i++)
    {
        Block *temp=rowArray[i];
 
        
        [temp upDateBlock];
        
        
        if(i==[rowArray count]-1)
        {
            int xLoc=[temp getXLocation];
           // NSLog([NSString stringWithFormat:@"%i",xLoc]);
            if(xLoc<(lengthOfViewController-(widthOfBlock*2)-.5))
            {
                score+=1;
                _scoreLabel.text=[NSString stringWithFormat:@"%i",score];
              
                int rand=arc4random()%3;
                if(rand>1)
                {
                [self setUpOppositeDoubleBlockRow];
                
                }
                else if(rand>0)
                {
                [self setUpDoubleBlockRow];
                }
                else
                {
                    [self setUpSingleBlockRow];
                }
                
            }
        }
    }
    
}

-(void)enterUser:(NSString *)sender
{
    
    [_db addUser:sender];
    [_db savePlist:[_db getDB]];
}


-(void)loadPlist
{
    NSString * plistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0] stringByAppendingPathComponent:@"database.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
    {
        plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    
    _db = [[dataBase alloc] initWithArray:(NSMutableArray *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc]];
}
-(void)showScore
{
    NSMutableArray * sizeOfData=[_db getDB];
    if([sizeOfData count]>0)
    {
        
        NSString * val= [_db getUser:(0)];
        int value=[val intValue];
        if(score>value)
        {
            [_db removeUser:(0)];
            val=[NSString stringWithFormat:@"%i",score];
            [_db addUser:val atIndex:0];
            _highScoreLabel.text = val;
        }
        

    }
    else
    {
        NSString *zero=[NSString stringWithFormat:@"%i",0];
        [_db addUser:zero atIndex:0];
        NSString * val=[NSString stringWithFormat:@"%i",score];
        [_db removeUser:0];
        [_db addUser:val atIndex:0];
        _highScoreLabel.text = val;
    }
    [_db savePlist:[_db getDB]];
     NSString * val= [_db getUser:(0)];
   
    
    

    [gameTimer invalidate];
    gameTimer=nil;
    [playerMovement invalidate];
    playerMovement=nil;
    
   
    
    
     _highScoreLabel.text=val;
   // _highScoreLabel.hidden=NO;
   // _scoreboard.hidden = NO;
    _scoreLabel.hidden = NO;
   // _okButtonImage.hidden = NO;
  
    sleep(3);
      [self dismissViewControllerAnimated:NO completion:nil];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
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

- (IBAction)goButtonPressed:(id)sender {
    
    [self setUpSingleBlockRow];
    _goButton.hidden=YES;
     gameTimer=[NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
    
    
}


-(void)gameLoop
{
    [self collisions];
    [self oppositeCollisions];
    [self movingBlocks];
}
@end
