//
//  ViewController+UIDynamicBehavior.swift
//  UIKitDynamicsSample
//
//  Created by Aina on 20/09/17.
//  Copyright © 2017 Mphasis. All rights reserved.
//

import UIKit

extension UIDynamicAnimator
{
    func initwithItems(_ items:[UIDynamicItem])
    {
        let gravityBehavior = UIGravityBehavior(items: items)
        self.addBehavior(gravityBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: items)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        self.addBehavior(collisionBehavior)
        
        let elasticityBehaviour = UIDynamicItemBehavior(items: items)
        elasticityBehaviour.elasticity = 0.7
        self.addBehavior(elasticityBehaviour)
    }
}
