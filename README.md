# MHSegmentedControl

A segmented control thing that looks cooler than the default one. It also has cool animations.


##Installation

Drag the ```MHSegmentedControl.[hm]``` into your project

##Usage

Initialize a new segmented control with the 
```- (instancetype)initWithFrame:(CGRect)frame Option:(NSString *)option1 andOption:(NSString *)option2 backgroundColor:(UIColor *)backgroundColor selectedIndex:(NSInteger)selectedIndex;```
method. 

There is also a delegate that gets notified when the selected index changes:

```
@protocol MHSegmentedControlDelegate <NSObject>

- (void)didTransitionToIndex:(NSInteger)index;

@end
```

##License

See LICENSE file

##Contact

Hit me up on twitter: [@softieeng](https://twitter.com/softieeng)