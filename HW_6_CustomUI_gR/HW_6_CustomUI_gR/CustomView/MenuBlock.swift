//
//  MenuBlock.swift
//  HW_6_CustomUI_gR
//
//  Created by Macbook on 03.09.2022.
//

import Foundation
import UIKit

protocol MenuBlockDelegate: NSObject {
    func menuElementPressed(_ elementTouch: MenuBlock)
}

class MenuBlock: UIView {
    
    @IBOutlet weak var menuBlock: UIView!
    @IBOutlet weak var imageMenuBlock: UIImageView!
    @IBOutlet weak var labelMenuBlock: UILabel!
    
    weak var delegate: MenuBlockDelegate?
    
    override func awakeFromNib() {
       super.awakeFromNib()

       let touch = UITapGestureRecognizer(target: self, action: #selector(menuElementPressed(_:)))
       self.isUserInteractionEnabled = true
       self.addGestureRecognizer(touch)
   }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MenuBlock", owner: self, options: nil)
        menuBlock.fixInView(self)
        menuBlock.layer.cornerRadius = 15
    }
    func configure(with text: String, image: UIImage, colorFont: UIColor) {
        imageMenuBlock.layer.cornerRadius = imageMenuBlock.frame.width / 2
        
        labelMenuBlock.text = text
        imageMenuBlock.image = image
        imageMenuBlock.backgroundColor = colorFont 
    }

    @objc func menuElementPressed(_ sender: UITapGestureRecognizer) {

        delegate?.menuElementPressed(self)
    }

}
   




