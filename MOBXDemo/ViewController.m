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
@property (nonatomic,weak) UILabel *labelName;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:({
        UILabel *label = UILabel.new;
        label.text = @"Init value";
        [label sizeToFit];
        label.center = CGPointMake(80, 100);
        self.labelName = label;
        self.labelName;
    })];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [Rest getVersion:^(id  _Nonnull data) {
        NSLog(@"%@",data);
    } onError:^(NSError * _Nonnull err) {
        NSLog(@"%@", err);
    }];
}


@end
