//
//  CustomAlertView.m
//  DynamicsAlertView
//
//  Created by Albert Villanueva on 12/2/15.
//  Copyright (c) 2015 Albert Villanueva. All rights reserved.
//

#import "CustomAlertView.h"


@interface CustomAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) NSString *mainText;
@property (nonatomic, strong) UISnapBehavior *snapBehavior;
@property (nonatomic, strong) NSString *okButtonText;
@property (nonatomic, strong) NSString *cancelButtonText;

@end

@implementation CustomAlertView

static CGFloat const buttonHeight = 50;
static CGFloat const alertWidth = 250;
static CGFloat const alertHeight = 150;
static CGFloat const mainTextMargin = 15;


- (UIDynamicAnimator *)animator{
    
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc]init];
        
    }
    return _animator;
}


- (instancetype)initWithFrame:(CGRect)frame {

    return  [self initWithFrame:frame mainText:@"Add a main text to show here as a main text." okButtonText:@"OK"];
}

- (instancetype)initWithFrame:(CGRect)frame mainText:(NSString *)mainText okButtonText:(NSString *)okButtonText {
    self = [super initWithFrame:frame];
    if (self) {
        _mainText = mainText;
        _okButtonText = okButtonText;
         [self createAlertViewWithSingleButton];
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.6];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame mainText:(NSString *)mainText okButtonText:(NSString *)okButtonText andCancelButtontext:(NSString *)cancelButtonText {
    
    self = [super initWithFrame:frame];
    if (self) {
        _mainText = mainText;
        _okButtonText = okButtonText;
        _cancelButtonText = cancelButtonText;
        [self createAlertViewWithTwoButtons];
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.6];
    }
    return self;
}

- (void)createAlertViewWithSingleButton{
    
    UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)/2 - alertWidth/2,
                                                               -400,
                                                               alertWidth,
                                                                alertHeight)];
    
    alertView.backgroundColor = [UIColor clearColor];
    alertView.alpha = 0.9;
    alertView.clipsToBounds = YES;
    alertView.layer.cornerRadius = 0;
    [self addSubview:alertView];
    self.alertView = alertView;
    
    UILabel *mainTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(mainTextMargin, 0, alertWidth - mainTextMargin*2, alertHeight - buttonHeight)];
    mainTextLabel.text = self.mainText;
    mainTextLabel.textColor = [UIColor colorWithWhite:0.05 alpha:1.0];
    mainTextLabel.font = [UIFont systemFontOfSize:14];
    mainTextLabel.numberOfLines = 0;
    mainTextLabel.textAlignment  = NSTextAlignmentCenter;
    [alertView addSubview:mainTextLabel];
    
    
    UIButton *dismissButton = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.alertView.bounds) - 45, CGRectGetWidth(self.alertView.bounds), 45)];
    [dismissButton addTarget:self action:@selector(okButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    dismissButton.backgroundColor = [UIColor clearColor];
    [dismissButton setTitle:self.okButtonText forState:UIControlStateNormal];
    [dismissButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [dismissButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    [alertView addSubview:dismissButton];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(2, 20, 100, 30)];
    
    self.titleLabel.backgroundColor = [UIColor blueColor];
    
    self.snapBehavior = [[UISnapBehavior alloc]initWithItem:alertView snapToPoint:self.center];
    
    [self.animator addBehavior:self.snapBehavior];

}

- (void)createAlertViewWithTwoButtons{
    
    UIView *alertView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)/2 - alertWidth/2,
                                                                -400,
                                                                alertWidth,
                                                                alertHeight)];
    
    alertView.backgroundColor = [UIColor whiteColor];
    alertView.alpha = 0.9;
    alertView.clipsToBounds = YES;
    alertView.layer.cornerRadius = 0;
    [self addSubview:alertView];
    self.alertView = alertView;
    
    UILabel *mainTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(mainTextMargin, 0, alertWidth - mainTextMargin*2, alertHeight - buttonHeight)];
    mainTextLabel.text = self.mainText;
    mainTextLabel.backgroundColor = [UIColor clearColor];
    mainTextLabel.textColor = [UIColor colorWithWhite:0.05 alpha:1.0];
    mainTextLabel.font = [UIFont systemFontOfSize:14];
    mainTextLabel.numberOfLines = 0;
    mainTextLabel.textAlignment  = NSTextAlignmentCenter;
    [alertView addSubview:mainTextLabel];
    
    
    UIButton *okButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.alertView.bounds) / 2, CGRectGetHeight(self.alertView.bounds) - 45, CGRectGetWidth(self.alertView.bounds) / 2, 45)];
    [okButton addTarget:self action:@selector(okButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    okButton.backgroundColor = [UIColor clearColor];
    [okButton setTitle:self.okButtonText forState:UIControlStateNormal];
    [okButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [okButton.layer setBorderWidth:0.3];
    [okButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [okButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [alertView addSubview:okButton];
    
    UIButton *cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.alertView.bounds) - 45, CGRectGetWidth(self.alertView.bounds) / 2, 45)];
    [cancelButton addTarget:self action:@selector(cancelButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.backgroundColor = [UIColor clearColor];
    [cancelButton setTitle:self.cancelButtonText forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [cancelButton.layer setBorderWidth:0.3];
    [cancelButton.layer setBorderColor:[UIColor grayColor].CGColor];
    [cancelButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [alertView addSubview:cancelButton];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(2, 20, 100, 30)];
    
    self.titleLabel.backgroundColor = [UIColor blackColor];
    
    self.snapBehavior = [[UISnapBehavior alloc]initWithItem:alertView snapToPoint:self.center];
    
    [self.animator addBehavior:self.snapBehavior];
    
}


- (void)okButtonPressed{
    
    NSLog(@"OK");
    
    [self.delegate didSelectOkButton];
    [self dismissAlertView];
}

- (void)cancelButtonPressed{
    
    NSLog(@"Cancel");
    [self.delegate didSelectCancelButton];
    [self dismissAlertView];
}

- (void)dismissAlertView{
    
    
    [self.animator removeBehavior:self.snapBehavior];
    
    [UIView animateWithDuration:0.4 animations:^{
        self.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    self.snapBehavior = [[UISnapBehavior alloc]initWithItem:self.alertView snapToPoint:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)+ self.alertView.frame.size.height)];
    
    [self.animator addBehavior:self.snapBehavior];

}

@end
