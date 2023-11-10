//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Raúl Pavón on 17/02/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var percentage: String?
    var split: String?
    var totalAmount: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalAmount
        setSettingLabel()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func setSettingLabel() {
        settingsLabel.text = "Split between \(split ?? "") people, with \(percentage ?? "") tip."
    }
}
