//
//  MHSegmentedControl.m
//  MHSegmentedControl
//
//  Created by Mark Hall on 2015-07-18.
//  Copyright © 2015 Mark Hall. All rights reserved.
//

#import "MHSegmentedControl.h"

@interface MHSegmentedControl()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIView *selectorView;

@end

@implementation MHSegmentedControl


- (instancetype)initWithFrame:(CGRect)frame Option:(NSString *)option1 andOption:(NSString *)option2 backgroundColor:(UIColor *)backgroundColor selectedIndex:(NSInteger)selectedIndex
{
    self = [super init];
    if (self){
        self.frame = frame;
        self.layer.cornerRadius = frame.size.height / 2;
        self.backgroundColor = backgroundColor;
        
        self.selectorView = [[UIView alloc]initWithFrame:CGRectMake(2, 2, frame.size.width/2 - 4, frame.size.height - 4)];
        self.selectorView.translatesAutoresizingMaskIntoConstraints = NO;
        self.selectorView.backgroundColor = [UIColor whiteColor];
        self.selectorView.layer.cornerRadius = self.selectorView.frame.size.height/2;
        [self addSubview:self.selectorView];
        
        self.leftLabel = [[UILabel alloc]init];
        self.leftLabel.text = option1;
        self.leftLabel.textAlignment = NSTextAlignmentCenter;
        self.leftLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.leftLabel.tag = 0;
        self.leftLabel.userInteractionEnabled = YES;
        [self.leftLabel sizeToFit];
        [self addSubview:self.leftLabel];
        
        UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTapped:)];
        [self.leftLabel addGestureRecognizer:leftTap];
        
        NSString *format = @"H:|-0-[leftLabel(==width)]";
        NSDictionary *metrics = @{@"width": @(frame.size.width/2)};
        NSDictionary *views = @{@"leftLabel": self.leftLabel};
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:metrics views:views]];
        
        
        NSString *vFormat = @"V:|-0-[leftLabel]-0-|";
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vFormat options:0 metrics:nil views:views]];
        
        self.rightLabel = [[UILabel alloc]init];
        self.rightLabel.text = option2;
        self.rightLabel.textAlignment = NSTextAlignmentCenter;
        self.rightLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.rightLabel.tag = 1;
        self.rightLabel.userInteractionEnabled = YES;
        [self.rightLabel sizeToFit];
        [self addSubview:self.rightLabel];
        
        UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTapped:)];
        [self.rightLabel addGestureRecognizer:rightTap];
        
        NSString *format2 = @"H:[rightLabel(==width)]-0-|";
        NSDictionary *metrics2 = @{@"width": @(frame.size.width/2)};
        NSDictionary *views2 = @{@"rightLabel": self.rightLabel};
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format2 options:0 metrics:metrics2 views:views2]];
        
        NSString *vFormat2 = @"V:|-0-[rightLabel]-0-|";
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vFormat2 options:0 metrics:nil views:views2]];
        
        [self setSelectedIndex:selectedIndex animated:NO];
    }
    return self;
}

- (void)setSelectedIndex:(NSInteger)index animated:(BOOL)animated
{
    switch (index) {
        case 0:{
            self.leftLabel.textColor = self.backgroundColor;
            [UIView animateWithDuration:animated ? 0.2 : 0 animations:^{
                self.selectorView.frame = CGRectMake(2, 2, self.frame.size.width/2 - 4, self.frame.size.height - 4);
            }];
            self.rightLabel.textColor = [UIColor whiteColor];
        }
            break;
        case 1:{
            self.leftLabel.textColor = [UIColor whiteColor];
            [UIView animateWithDuration:animated ? 0.2 : 0 animations:^{
                self.selectorView.frame = CGRectMake(self.frame.size.width/2 + 2, 2, self.frame.size.width/2 - 4, self.frame.size.height - 4);
            }];
            self.rightLabel.textColor = self.backgroundColor;
        }
            break;
    }
}

- (void)labelTapped:(UITapGestureRecognizer *)gesture
{
    UIView *tappedView = [gesture view];
    [self setSelectedIndex:tappedView.tag animated:YES];
    [self.delegate didTransitionToIndex:tappedView.tag];    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
