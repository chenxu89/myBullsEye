//
//  ViewController.h
//  myBullsEye
//
//  Created by 陈旭 on 4/30/15.
//  Copyright (c) 2015 陈旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *roundLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;

- (IBAction)slideMoved:(UISlider *)slider;
- (IBAction)showAlert;
- (IBAction)startOver;

@end

