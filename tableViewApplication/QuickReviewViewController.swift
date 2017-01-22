//
//  QuickReviewViewController.swift
//  tableViewApplication
//
//  Created by Dmitriy on 22/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import UIKit

class QuickReviewViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var windowView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let darkBlurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let darkBlurEffectView = UIVisualEffectView(effect: darkBlurEffect)
        darkBlurEffectView.frame = view.bounds
        backgroundImageView.addSubview(darkBlurEffectView)
        
        let scaleAnimation = CGAffineTransform(scaleX: 0.0, y: 0.0)
        let translationAnimation = CGAffineTransform(translationX: 0, y: 600)
        windowView.transform = scaleAnimation.concatenating(translationAnimation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            let scaleAnimation = CGAffineTransform(scaleX: 1.0, y: 1.0)
            let translationAnimation = CGAffineTransform(translationX: 0, y: 0)
            self.windowView.transform = scaleAnimation.concatenating(translationAnimation)
        }, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
