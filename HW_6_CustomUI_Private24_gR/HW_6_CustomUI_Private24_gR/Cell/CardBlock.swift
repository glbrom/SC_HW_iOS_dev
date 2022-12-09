//
//  CardBlock.swift
//  HW_6_CustomUI_Private24_gR
//
//  Created by Macbook on 11.09.2022.
//

import UIKit

class CardBlock: UIView {

    @IBOutlet weak var nameCardLabel: UILabel!
    @IBOutlet weak var numberCardLabel: UILabel!
    @IBOutlet weak var dateCardLabel: UILabel!
    @IBOutlet weak var balanceCardLabel: UILabel!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var imageCardBlock: UIImageView!
    @IBOutlet weak var cardBlockButton: UIButton!
    
    weak var delegate: CardBlockDelegate?
    var touch: CardPressed?

override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
}

func commonInit() {
    Bundle.main.loadNibNamed("CardBlock", owner: self, options: nil)
    contentView.fixInView(self)
}

func configure(with text: String, image: UIImage, color: UIColor, cornerRadius: CGFloat, touch: CardPressed) {
    numberCardLabel.text = text
    self.imageCardBlock.image = image
    self.touch = touch
    
    imageCardBlock.layer.cornerRadius = cornerRadius
}

    @IBAction func cardBlockButtonPressed(_ sender: Any) {
        delegate?.cardBlockPressed(touch: self.touch!)
    }

}

protocol CardBlockDelegate: NSObject {
func cardBlockPressed(touch: CardPressed)
}

enum CardPressed: String {
case credit = "Картка кредитна"
case universal = "Картка Універсальна"
case payment = "Картка для виплат"
}

extension UIView
{
func fixInView(_ container: UIView!) -> Void{
    self.translatesAutoresizingMaskIntoConstraints = false;
    self.frame = container.frame;
    container.addSubview(self);
    NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
    NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
}
}
