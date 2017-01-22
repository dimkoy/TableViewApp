//
//  ShareViewController.swift
//  tableViewApplication
//
//  Created by Dmitriy on 22/01/2017.
//  Copyright © 2017 Dmitriy. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

   
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var topLeft: UIView!
    @IBOutlet weak var topRight: UIView!
    @IBOutlet weak var bottomLeft: UIView!
    @IBOutlet weak var bottomRight: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topLeft.transform = CGAffineTransform(translationX: 0, y: -600)
        topRight.transform = CGAffineTransform(translationX: 0, y: -600)
        bottomRight.transform = CGAffineTransform(translationX: 0, y: 600)
        bottomLeft.transform = CGAffineTransform(translationX: 0, y: 600)
       
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.topLeft.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.topRight.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.bottomRight.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.6, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.bottomLeft.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
