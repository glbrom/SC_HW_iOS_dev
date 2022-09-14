//
//  FirstViewController.swift
//  HW_5_gR
//
//  Created by Macbook on 09.08.2022.
//

import UIKit

class FirstViewController: UIViewController {

    var circle = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        circle = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250) )
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.center = view.center
        circle.backgroundColor = .systemGreen

        self.view.addSubview(circle)
    }

}
