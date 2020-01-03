//
//  ViewController.m
//  MOBXDemo
//
//  Created by Chang Liu on 12/18/19.
//  Copyright © 2019 Misocode. All rights reserved.
//

#import "ViewController.h"
#import <MOBX/MOBX.h>

#define W UIScreen.mainScreen.bounds.size.width

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label01;
@property (weak, nonatomic) IBOutlet UITextField *tf001;
@property (weak, nonatomic) IBOutlet UITextField *tf002;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label01.text = NSUserDefaults.getBaseURL;
}

- (IBAction)tap001:(id)sender {
    [NSUserDefaults setBaseURL:self.tf001.text];
    self.label01.text = self.tf001.text;
    self.tf001.text = @"";
}
- (IBAction)tap002:(id)sender {
}
- (IBAction)tap003:(id)sender {
}
- (IBAction)tap004:(id)sender {
}
- (IBAction)tap005:(id)sender {
}
- (IBAction)tap006:(id)sender {
}
- (IBAction)tap007:(id)sender {
}
- (IBAction)tap008:(id)sender {
}

@end
