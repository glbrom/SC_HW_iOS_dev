//
//  UIStoryBoardViewController.swift
//  HW_6_gR
//
//  Created by Macbook on 27.08.2022.
//

import UIKit

class UIStoryBoardViewController: UIViewController {
    
    @IBOutlet weak var yellowCircleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yellowCircleView.frame = CGRect(x: 0, y: 30, width: 50, height: 50)
        yellowCircleView.layer.cornerRadius = yellowCircleView.frame.width / 2
        yellowCircleView.isHidden = true
        
    }
    
    
    @IBAction func runButton(_ sender: Any) {
        
        yellowCircleView.isHidden = false
        let frameHeight = self.yellowCircleView.frame.height / 2
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.yellowCircleView.center.x = self.view.frame.maxX - frameHeight
        }
        UIView.animate(withDuration: 1, delay: 1) {
            self.yellowCircleView.center.y = self.view.frame.maxY - frameHeight
        }
        UIView.animate(withDuration: 1, delay: 2) {
            self.yellowCircleView.center.x = self.view.frame.minX + frameHeight
        }
        UIView.animate(withDuration: 1, delay: 3) {
            self.yellowCircleView.center.y = self.view.frame.minY + frameHeight
            self.yellowCircleView.alpha = 0
        }
    }
}
