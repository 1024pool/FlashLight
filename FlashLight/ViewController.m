//
//  ViewController.m
//  Light
//
//  Created by 苏青章 on 15/2/22.
//  Copyright (c) 2015年 Bob. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize isLightOn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    isLightOn = NO;
    
    NSLog(@"L31 ViewController.m  %@" , isLightOn?@"YES":@"NO");
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if(![device hasTorch])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"闪光灯" message:@"要不要亮一下啊" delegate:self cancelButtonTitle:@"好吧" otherButtonTitles:nil];
        [alert show];
    //    [alert release];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)turnOnLed:(bool)update
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([device hasTorch])
    {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }
    
    if(update)
    {
        NSLog(@"sb L61");
        [__btnOnOff  setBackgroundImage:[UIImage imageNamed:@"c2"] forState:UIControlStateNormal];
        isLightOn = YES;
    }
}

- (void)turnOffLed:(bool)update
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([device hasTorch])
    {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }
    
    if(update)
    {
        NSLog(@"sb L79");
        [__btnOnOff  setBackgroundImage:[UIImage imageNamed:@"c1"] forState:UIControlStateNormal];
        isLightOn = NO;
    }
}

- (void)dealloc
{
    //[__btnOnOff release];
    //[super dealloc];
}

- (IBAction)onButtonShine:(id)sender
{
    if(isLightOn)
    {
        [self turnOffLed:YES];
    }else{
        NSLog(@"turn on");
        [self turnOnLed:YES];
    }
}

@end
