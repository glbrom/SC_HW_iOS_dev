//
//  LottieAnimationViewController.swift
//  HW_6_gR
//
//  Created by Macbook on 01.09.2022.
//

    import UIKit
    import Lottie

class LottieAnimationViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()

            let animationEnjoy = AnimationView(name: "enjoying-sloth")
          
            animationEnjoy.frame = CGRect(x: 0, y: 100, width: 400, height: 400)
            animationEnjoy.loopMode = .loop
            animationEnjoy.play()
            self.view.addSubview(animationEnjoy)
        }
        
    }
