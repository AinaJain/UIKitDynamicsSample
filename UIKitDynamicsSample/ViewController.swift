//
//  ViewController.swift
//  UIKitDynamicsSample
//
//  Created by Aina on 20/09/17.
//  Copyright © 2017 Mphasis. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITabBarDelegate,UIDynamicAnimatorDelegate ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var scrollParentView: UIView!
    var animator : UIDynamicAnimator?
    var timer = Timer()
    var hasStopped = false
    var lastIndex : IndexPath?
    
    @IBOutlet weak var scrollView: UICollectionView!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var redItem: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UIDynamics methods for bounce

    @objc func createBounce(withView childView: UIView, inView mainView: UIView)
    {
        if hasStopped
        {
            childView.frame.origin.y = childView.frame.origin.y - 100
            hasStopped = false
        }
        print("Ball bounced")
        animator = UIDynamicAnimator(referenceView: mainView)
        animator?.delegate = self
        animator?.initwithItems([childView])
    }
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        hasStopped = true
    }

    //MARK: CAKeyframeAnimation methods for jump

    func jump(withView jumpingView: UIView, inView mainView : UIView)
    {
        let midHeight = mainView.frame.size.height * 0.5
        let animation = CAKeyframeAnimation.dockBounceAnimationWithViewHeight(WithViewHeight: midHeight)
        jumpingView.layer.add(animation, forKey: "bouncing")
    }
    
    //MARK: UIView:Animation methods for blink

    @IBAction func didTapBlinkButton(_ sender: UIButton) {
        
        if  !sender.isSelected
        {
            sender.isSelected = true
            sender.startFlashingbutton()
        }
        else
        {
            sender.isSelected = false
            sender.stopFlashingbutton()
        }
        
    }
    
    //MARK: Tab bar handling

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            parentView.isHidden = false
            redButton.isHidden = true
            scrollParentView.isHidden = true
            createBounce(withView: redItem, inView: parentView)
            
        case 1:
            parentView.isHidden = true
            redButton.isHidden = false
            scrollParentView.isHidden = true
            didTapBlinkButton(redButton)
            
        case 2:
            parentView.isHidden = false
            redButton.isHidden = true
            scrollParentView.isHidden = true
            parentView.transform = CGAffineTransform(rotationAngle: .pi/2)
            jump(withView: redItem, inView: parentView)
            break
        case 3:
            parentView.isHidden = true
            redButton.isHidden = true
            scrollParentView.isHidden = false
            scrollView.delegate = self
            scrollView.dataSource = self
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 50
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellItemIdentifier" , for: indexPath as IndexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let _ = lastIndex
//        {
//            hasStopped = lastIndex == indexPath
//        }
        let cell = scrollView.cellForItem(at: indexPath)
        createBounce(withView: cell!, inView: scrollView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        lastIndex = indexPath
    }
    
}

