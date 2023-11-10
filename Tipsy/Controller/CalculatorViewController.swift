//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Raúl Pavón on 17/02/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var totalPerPerson: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zeroPctButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        switch sender.titleLabel?.text {
        case "0%":
            zeroPctButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPctButton.isSelected = false
        case "10%":
            zeroPctButton.isSelected = false
            tenPcButton.isSelected = true
            twentyPctButton.isSelected = false
        case "20%":
            zeroPctButton.isSelected = false
            tenPcButton.isSelected = false
            twentyPctButton.isSelected = true
        default:
            break
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Float(billTextField.text ?? "") ?? 0.0
        let splitNumber = Float(splitNumberLabel.text ?? "") ?? 0.0
        
        if zeroPctButton.isSelected {
            print(Float(0) / 100)
            print(splitNumberLabel.text ?? "")
            print(billTextField.text ?? "")
            
            totalPerPerson = bill / splitNumber
            print(totalPerPerson)
            performSegue(withIdentifier: "goToResult", sender: self)
        } else if tenPcButton.isSelected {
            print(Float(10) / 100)
            print(splitNumberLabel.text ?? "")
            print(billTextField.text ?? "")
            
            totalPerPerson = (bill * 1.1) / splitNumber
            print(totalPerPerson)
            performSegue(withIdentifier: "goToResult", sender: self)
        } else {
            print(Float(20) / 100)
            print(splitNumberLabel.text ?? "")
            print(billTextField.text ?? "")
            
            totalPerPerson = (bill * 1.2) / splitNumber
            print(totalPerPerson)
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.split = splitNumberLabel.text
            destinationVC.totalAmount = String(format: "%.2f", totalPerPerson)
            if zeroPctButton.isSelected {
                destinationVC.percentage = "0%"
            } else if tenPcButton.isSelected {
                destinationVC.percentage = "10%"
            } else {
                destinationVC.percentage = "20%"
            }
        }
    }
}
