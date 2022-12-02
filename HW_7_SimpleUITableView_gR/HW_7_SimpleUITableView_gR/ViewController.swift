//
//  ViewController.swift
//  HW_7_SimpleUITableView_gR
//
//  Created by Macbook on 04.09.2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    let monthArray: [String] = ["January",
                                "February",
                                "March",
                                "April",
                                "May",
                                "June",
                                "July",
                                "August",
                                "September",
                                "October",
                                "November",
                                "December"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let month = monthArray[indexPath.row]
        cell.textLabel?.text = "\(month)"
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monthArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MonthNumberViewController") as! MonthNumberViewController
        
        viewController.name = "\(monthArray[indexPath.row])"
        viewController.number = (indexPath.row + 1)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
