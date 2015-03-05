//
//  ViewController.m
//  CustomAlertView
//
//  Created by Albert Villanueva on 5/3/15.
//  Copyright (c) 2015 Albert Villanueva. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlertPressed:(UIButton *)sender {
    
    CustomAlertView *alertView = [[CustomAlertView alloc]initWithFrame:self.view.frame mainText:@"Hello!!! 🙈" okButtonText:@"OK" andCancelButtontext:@"Cancel"];
    [self.view addSubview:alertView];
}


@end
