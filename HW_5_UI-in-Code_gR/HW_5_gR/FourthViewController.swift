//
//  FourthViewController.swift
//  HW_5_gR
//
//  Created by Macbook on 09.08.2022.
//

import UIKit

class FourthViewController: UIViewController {
    
    var whiteCircle = UIView()
    var (yellowCircle, redCircle, greenCircle, blueCircle) = (UIView(), UIView(), UIView(), UIView())
    var sizeCircleSmall = 200
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        whiteCircle = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
                whiteCircle.layer.cornerRadius = whiteCircle.frame.width / 2
                whiteCircle.center = view.center
                whiteCircle.backgroundColor = .black
        
        greenCircle = UIView(frame: CGRect(x: -30, y: -30, width: sizeCircleSmall, height: sizeCircleSmall))
                greenCircle.layer.cornerRadius = greenCircle.frame.width / 2
                greenCircle.backgroundColor = .systemGreen

        blueCircle = UIView(frame: CGRect(x: 130, y: -30, width: sizeCircleSmall, height: sizeCircleSmall))
                blueCircle.layer.cornerRadius = blueCircle.frame.width / 2
                blueCircle.backgroundColor = .systemBlue

        yellowCircle = UIView(frame: CGRect(x: -30, y: 130, width: sizeCircleSmall, height: sizeCircleSmall))
                yellowCircle.layer.cornerRadius = yellowCircle.frame.width / 2
                yellowCircle.backgroundColor = .systemYellow

        redCircle = UIView(frame: CGRect(x: 130, y: 130, width: sizeCircleSmall, height: sizeCircleSmall))
                redCircle.layer.cornerRadius = redCircle.frame.width / 2
                redCircle.backgroundColor = .systemRed
        
      
        
        self.whiteCircle.clipsToBounds = true
        self.view.addSubview(whiteCircle)
        whiteCircle.addSubview(greenCircle)
        whiteCircle.addSubview(blueCircle)
        whiteCircle.addSubview(redCircle)
        whiteCircle.addSubview(yellowCircle)
     
        
        
       
    }
    


}
