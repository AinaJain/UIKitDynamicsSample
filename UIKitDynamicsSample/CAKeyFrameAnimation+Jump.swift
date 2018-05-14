//
//  CAKeyFrameAnimation+Jump.swift
//  UIKitDynamicsSample
//
//  Created by Aina on 22/09/17.
//  Copyright © 2017 Mphasis. All rights reserved.
//

import UIKit

extension CAKeyframeAnimation {
    
    class func dockBounceAnimationWithViewHeight(WithViewHeight viewHeight:CGFloat) ->CAKeyframeAnimation
    {
        let kNumFactors = 22
        let kFactorsPerSec :CGFloat = 30.0
        let kFactorsMaxValue :CGFloat = 128.0
        let factors = [0, 60, 83, 100, 114, 124, 128, 128, 124, 114, 100, 83, 60, 32, 0, 0, 18, 28, 32, 28, 18, 0]
        var transforms = [CATransform3D]()
        for value in 0..<kNumFactors
        {
            let positionOffset = CGFloat(factors[value]) / kFactorsMaxValue * viewHeight
            let transform = CATransform3DMakeTranslation(0.0, -positionOffset, 0.0)
            transforms.append(transform)
        }
        
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.repeatCount = 1
        animation.duration = CFTimeInterval(CGFloat(kNumFactors) * 1.0/kFactorsPerSec)
        animation.fillMode = kCAFillModeForwards
        animation.values = transforms
        animation.isRemovedOnCompletion = true // final stage is equal to starting stage
        animation.autoreverses = false
        return animation
    }
    
    func animate(view : UIView)
    {
        let origin = view.center
        let target = 
        CGPoint origin = self.imageView.center;
        CGPoint target = CGPointMake(self.imageView.center.x, self.imageView.center.y+100);
        CABasicAnimation *bounce = [CABasicAnimation animationWithKeyPath:@"position.y"];
        bounce.duration = 0.5;
        bounce.fromValue = [NSNumber numberWithInt:origin.y];
        bounce.toValue = [NSNumber numberWithInt:target.y];
        bounce.repeatCount = 2;
        bounce.autoreverses = YES;
        [self.imageView.layer addAnimation:bounce forKey:@"position"];

        
    }
    
    
}
