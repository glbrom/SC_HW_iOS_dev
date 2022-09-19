//
//  ViewController.swift
//  HW_6_CustomUI_gR
//
//  Created by Macbook on 03.09.2022.
//

import UIKit

class ViewController: UIViewController, MenuBlockDelegate {
    
    @IBOutlet weak var firstMenuBlock: MenuBlock!
    @IBOutlet weak var secondMenuBlock: MenuBlock!
    @IBOutlet weak var thirdMenuBlock: MenuBlock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstMenuBlock.configure(with: "Рассрочка на карту", image: UIImage(systemName: "rectangle.split.3x3")!, colorFont: .systemGreen)
        
        secondMenuBlock.configure(with: "Покупка \nЧастями", image: UIImage(systemName: "circle.slash")!, colorFont: .systemPurple)
        
        thirdMenuBlock.configure(with: "Архив", image: UIImage(systemName: "archivebox")!, colorFont: .systemGray)
        
        firstMenuBlock.delegate = self
        secondMenuBlock.delegate = self
        thirdMenuBlock.delegate = self
        
    }
    
    func menuElementPressed(_ elementTouch: MenuBlock) {
        print("Выбранный элемент меню - `\(elementTouch.labelMenuBlock.text ?? "Элемент не выбран")`")
    }
}


