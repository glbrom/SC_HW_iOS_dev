//
//  PostCellTableViewCell.swift
//  HW_7_UITableViewInsta_gR
//
//  Created by Macbook on 04.09.2022.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {

    static let reuseId = "PostCellTableViewCell"
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var nameAccount: UILabel!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var countOfCommentsLabel: UILabel!
    @IBOutlet weak var postedAtLabel: UILabel!
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        self.avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
    }
    
}
