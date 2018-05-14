//
//  ViewController+Blink.swift
//  UIKitDynamicsSample
//
//  Created by Aina on 21/09/17.
//  Copyright © 2017 Mphasis. All rights reserved.
//

import UIKit

extension UIButton {

    func startFlashingbutton()
    {
    alpha = 1.0
    UIView.animate(withDuration: 0.1,
                   delay: 0.1,
                   options: [.curveEaseInOut,.repeat,.autoreverse,.allowUserInteraction],
                   animations: {
                    self.alpha = 0.0
                    },
                   completion: nil)
    }
    
   func stopFlashingbutton()
    {
        UIView.animate(withDuration: 0.1,
                       delay: 0.0,
                       options: [.curveEaseInOut,.beginFromCurrentState],
                       animations: {
                        self.alpha = 1.0
        },
                       completion: nil)
    }

}
