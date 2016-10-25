//
//  LightboxTransition.swift
//  Facebook
//
//  Created by Kathryn Hastings on 10/24/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let newsFeedViewController = navigationController.topViewController as! NewsFeedViewController
        let toViewController = toViewController as! PhotoViewController
        
        // let imageView: UIImageView!
        
        
        // toViewController.view.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            // toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    
}
