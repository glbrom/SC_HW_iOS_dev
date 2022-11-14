//
//  UIKitAnimationViewController.swift
//  HW_6_gR
//
//  Created by Macbook on 27.08.2022.
//

import UIKit

class UIKitAnimationViewController: UIViewController {
    
    @IBOutlet weak var circle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        circle.layer.cornerRadius = circle.frame.width / 2
        
    }
    
    @IBAction func bounceButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 5) {
            self.circle.center.y = self.view.frame.height - self.circle.frame.height
        } completion: { value in
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 5, options: [.autoreverse, .repeat]) {
                self.circle.center = self.view.center
                self.circle.backgroundColor = .systemYellow
            }
            
        }
        
    }
}
