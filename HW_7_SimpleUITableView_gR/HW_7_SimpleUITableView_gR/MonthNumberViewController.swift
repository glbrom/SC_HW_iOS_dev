//
//  MonthNumberViewController.swift
//  HW_7_SimpleUITableView_gR
//
//  Created by Macbook on 04.09.2022.
//

import UIKit

class MonthNumberViewController: UIViewController {

    @IBOutlet weak var numberOfMonth: UILabel!
    @IBOutlet weak var monthName: UILabel!
    
    var name: String? = " "
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        monthName.text = name
        numberOfMonth.text = "\(number)"
    }
    
}
