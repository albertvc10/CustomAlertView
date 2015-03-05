//
//  CustomAlertView.h
//  DynamicsAlertView
//
//  Created by Albert Villanueva on 12/2/15.
//  Copyright (c) 2015 Albert Villanueva. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomAlertViewDelegate<NSObject>
@optional
- (void)didSelectOkButton;
- (void)didSelectCancelButton;
@end

@interface CustomAlertView : UIView

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, weak) id<CustomAlertViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame;
- (instancetype)initWithFrame:(CGRect)frame mainText:(NSString *)mainText okButtonText:(NSString *)okButtonText;
- (instancetype)initWithFrame:(CGRect)frame mainText:(NSString *)mainText okButtonText:(NSString *)okButtonText andCancelButtontext:(NSString *)cancelButtonText;

@end
