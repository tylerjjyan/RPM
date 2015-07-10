//
//  ViewController.m
//  RPM
//
//  Created by Tyler Yan on 2015-07-10.
//  Copyright (c) 2015 Foodee. All rights reserved.
//

#import "ViewController.h"
#define CONVERT_RADIANS(x) (M_PI * (x) / 180.0)

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *needle;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGFloat startingDegrees = 140;
    self.needle.transform = CGAffineTransformMakeRotation(CONVERT_RADIANS(startingDegrees));
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    [self.view addGestureRecognizer:panGesture];
}


-(void)didPan:(id)sender{
    
    UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer*)sender;
    
    CGPoint velocity = [sender velocityInView:self.view];
    float x = velocity.x;
    float y = velocity.y;
    float totalVelocity = sqrtf((powf(x, 2))+(powf(y, 2)));
    [self.needle setTransform:CGAffineTransformMakeRotation(CONVERT_RADIANS(totalVelocity + 140))];
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        [self.needle setTransform:CGAffineTransformMakeRotation(CONVERT_RADIANS(140))];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
