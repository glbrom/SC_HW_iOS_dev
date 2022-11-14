//
//  LottieViewController.swift
//  HW_6_gR
//
//  Created by Macbook on 27.08.2022.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let animationBanana = AnimationView(name: "banana")
      
        animationBanana.frame = CGRect(x: 0, y: 100, width: 400, height: 400)
        animationBanana.loopMode = .loop
        animationBanana.play()
        self.view.addSubview(animationBanana)
    }
    

}
