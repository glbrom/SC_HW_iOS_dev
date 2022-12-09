//
//  ViewController.swift
//  HW_6_CustomUI_Private24_gR
//
//  Created by Macbook on 11.09.2022.
//

import UIKit

class ViewController: UIViewController, CardBlockDelegate{


    @IBOutlet weak var viewAccount: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewAccount.layer.cornerRadius = viewAccount.frame.height / 2
        
    }
    func cardBlockPressed(touch: CardPressed) {
        switch touch {
        case .credit:
            print("Обрана ʼКредитка карткаʼ")
        case .payment:
            print("Обрана ʼКартка для виплатʼ")
        case .universal:
            print("Обрана ʼКартка Універсальнаʼ")
        }
    }

}

