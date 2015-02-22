//
//  ViewController.h
//  Light
//
//  Created by 苏青章 on 15/2/22.
//  Copyright (c) 2015年 Bob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *_btnOnOff;
@property BOOL isLightOn;

- (IBAction)onButtonShine:(id)sender;
- (void)turnOffLed:(bool)update;
- (void)turnOnLed:(bool)update;

@end

