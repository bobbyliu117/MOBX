//
//  ViewController.m
//  MOBXDemo
//
//  Created by Chang Liu on 12/18/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import "ViewController.h"
#import <MOBX/MOBX.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"ORIEN: %@", [ViewUtils isLandscape]?@"Land":@"Portrait");
}


@end
