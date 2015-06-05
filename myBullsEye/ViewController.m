//
//  ViewController.m
//  myBullsEye
//
//  Created by 陈旭 on 4/30/15.
//  Copyright (c) 2015 陈旭. All rights reserved.
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
    [self startNewGame];
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];

    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startNewRound{
    _targetValue = 1 + arc4random_uniform(100);
    [self updateLabels];
    self.slider.value = 50;
    
}

- (void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];
}

- (IBAction)showAlert{
    int difference = abs(_currentValue - _targetValue);
    int points = 100 - difference;;
    NSString *title;
    
    if (difference == 0){
        title = @"Perfect!";
        points += 100;
    }else if (difference < 5){
        title = @"You almost had it!";
        if (difference == 1) {
            points += 50;
        }
    }else if (difference < 10){
        title = @"Pretty good!";
    }else {
        title = @"Not even close...";
    }
    
    _score += points;
    _round += 1;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    
    [alertView show];
}

- (IBAction)alertView:(UIAlertView *)alertView
didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    [self startNewRound];
    
}

- (IBAction)slideMoved:(UISlider *)slider{
    _currentValue = roundf(slider.value);
    
}

- (void)startNewGame{
    _score = 0;
    _round = 0;
    [self startNewRound];
}

- (IBAction)startOver{
    
    [self startNewGame];
}


@end
