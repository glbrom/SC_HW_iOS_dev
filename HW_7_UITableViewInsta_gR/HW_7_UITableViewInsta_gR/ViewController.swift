//
//  ViewController.swift
//  HW_7_UITableViewInsta_gR
//
//  Created by Macbook on 04.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
//    var postArray: [Post] = [person1, person2, person3, person4, person5]
   
    var postArray: [Post] = [
    Post(avatarImageName: "1", nameAcc: "bob_123", postImageName: "1", viewsCount: 35, description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.", countOfComments: 12, postedAt: "5"),
    Post(avatarImageName: "2", nameAcc: "faster2", postImageName: "2", viewsCount: 78, description: "Et harum quidem rerum facilis est et expedita distinctio.", countOfComments: 71, postedAt: "18"),
    Post(avatarImageName: "3", nameAcc: "ron_oliver", postImageName: "3", viewsCount: 93, description: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", countOfComments: 445, postedAt: "25"),
    Post(avatarImageName: "4", nameAcc: "mike_jonse", postImageName: "4", viewsCount: 41, description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system", countOfComments: 123, postedAt: "39"),
    Post(avatarImageName: "5", nameAcc: "sara991", postImageName: "5", viewsCount: 54, description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.", countOfComments: 546, postedAt: "45")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let nib = UINib(nibName: "PostCellTableViewCell", bundle: nil)
//        self.tableView.register(nib, forCellReuseIdentifier: "PostCellTableViewCell")
        
        tableView.register(UINib(nibName: "PostCellTableViewCell", bundle: nil), forCellReuseIdentifier: PostCellTableViewCell.reuseId)
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCellTableViewCell.reuseId, for: indexPath) as! PostCellTableViewCell // guard else { return UITableViewCell()
            
        
        let post = postArray[indexPath.row]
        cell.avatarImage.image = UIImage(named: post.avatarImageName)
        cell.postImage.image = UIImage(named: post.postImageName)
    
        cell.nameAccount.text = post.nameAcc
        cell.viewCountLabel.text = "\(post.viewsCount) views"
        cell.countOfCommentsLabel.text = "View all \(post.countOfComments) comments"
        cell.postedAtLabel.text = "\(post.postedAt) minutes ago"
       
        
        let boldString = NSMutableAttributedString(string: post.nameAcc + " ", attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        boldString.append(NSMutableAttributedString(string: post.description))
        cell.descriptionLabel.attributedText = boldString

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
