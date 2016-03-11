//
//  ViewController.m
//  BullsEyes
//
//  Created by AppleA on 16/3/9.
//  Copyright © 2016年 AppleA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
    //
    UIImage *ThumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:ThumbImageNormal forState:UIControlStateNormal];
    //
    UIImage *ThunbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:ThunbImageHighlighted forState:UIControlStateHighlighted];
    
    //
    //
    UIImage *TrackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:TrackLeftImage forState:UIControlStateNormal];
    //
    UIImage *TrackRightImage = [[UIImage imageNamed:@"SliderTrackRight"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:TrackRightImage forState:UIControlStateNormal];
    
    
    
    [self startNewGame];
    [self updateLabels];
}

-(void)startNewRoud
{
    _currentValue = 50;
    _targetValue = 1 + arc4random_uniform(100);
    self.slider.value = _currentValue;
    
}

-(void)startNewGame
{
    _score = 0;
    _round = 0;
    [self startNewRoud];
}

- (IBAction)showAlert:(UIButton *)sender
{
    int difference = abs(_currentValue - _targetValue);
    int point = 100 - difference;
    
    _round += 1;
    
    NSString *title;
    if (0 == difference)
    {
        title = @"太棒了!!!";
        point += 100;
    }
    else if (5 > difference)
    {
        title = @"就差一点点！！";
        if (1 == difference)
        {
            point += 50;
        }
    }
    else if (15 > difference && 5 <= difference)
    {
        title = @"加油!";
    }
    else
    {
        title = @"差的有点远啊。。。";
    }
    
    _score += point;
    
    NSString *message = [NSString stringWithFormat:@"你的结果是 %d\n目标是 %d\n相差 %d\n得分 %d",_currentValue,_targetValue,difference,point];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"再来一次" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    [self startNewRoud];
    [self updateLabels];
}



- (IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
  
}

-(void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",_targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",_score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",_round];
}
- (IBAction)startOver:(UIButton *)sender
{
    [self startNewGame];
    [self updateLabels];
}


-(BOOL)prefersStatusBarHidden
{
    return YES;
}




@end
