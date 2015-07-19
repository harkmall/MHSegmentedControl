//
//  MHSegmentedControl.h
//  MHSegmentedControl
//
//  Created by Mark Hall on 2015-07-18.
//  Copyright © 2015 Mark Hall. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MHSegmentedControlDelegate <NSObject>

- (void)didTransitionToIndex:(NSInteger)index;

@end

@interface MHSegmentedControl : UIView

- (instancetype)initWithFrame:(CGRect)frame Option:(NSString *)option1 andOption:(NSString *)option2 backgroundColor:(UIColor *)backgroundColor selectedIndex:(NSInteger)selectedIndex;

@property (nonatomic, strong) id<MHSegmentedControlDelegate> delegate;

@end