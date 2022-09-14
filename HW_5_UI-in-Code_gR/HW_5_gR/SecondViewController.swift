//
//  SecondViewController.swift
//  HW_5_gR
//
//  Created by Macbook on 09.08.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var (redCircle, yellowCircle, greenCircle) = (UIView(), UIView(), UIView())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redCircle = UIView(frame: CGRect(x: 95, y: 90, width: 200, height: 200) )
        redCircle.layer.cornerRadius = redCircle.frame.width / 2
        redCircle.backgroundColor = .systemRed
        
        
        yellowCircle = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200) )
        yellowCircle.layer.cornerRadius = yellowCircle.frame.width / 2
        yellowCircle.center = view.center
        yellowCircle.backgroundColor = .systemYellow
        
        greenCircle = UIView(frame: CGRect(x: 95, y: 550, width: 200, height: 200) )
        greenCircle.layer.cornerRadius = greenCircle.frame.width / 2
        greenCircle.backgroundColor = .systemGreen

        self.view.addSubview(yellowCircle)
        self.view.addSubview(redCircle)
        self.view.addSubview(greenCircle)
    }

}
