//
//  ViewController.h
//  BullsEyes
//
//  Created by AppleA on 16/3/9.
//  Copyright © 2016年 AppleA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 

@property (nonatomic,weak) IBOutlet UISlider *slider;

@property (weak, nonatomic) IBOutlet UILabel *targetLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *roundLabel;

@property (weak, nonatomic) IBOutlet UIButton *startOver;


@end

