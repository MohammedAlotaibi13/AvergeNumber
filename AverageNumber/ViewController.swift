//
//  ViewController.swift
//  AverageNumber
//
//  Created by محمد عايض العتيبي on 13/11/1439 AH.
//  Copyright © 1439 code schoole. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    //MARK: variables
    var arr = [Int]()
    var trackNumber = 2
    var totalNumber = 0
    var stepperValue = 2
 
    @IBAction func stepper(_ sender: UIStepper) {
        stepperLabel.text = String(Int(sender.value))
        trackNumber = Int(sender.value)
        stepperValue = Int(sender.value)

    }
    
    @IBAction func addButton(_ sender: Any) {
        if(trackNumber >= 1){
            implementInput()
        } else {
            getAverage()
        }
    }

    @IBAction func againButton(_ sender: Any) {
        calculateAgain()
    }
    
    func implementInput(){
        if let text = textField.text {
            if (text == ""){
                resultLabel.text = "Please Add Number"
            }  else {
                stepper.isEnabled = false
                arr.append(Int(text)!)
                textField.text = ""
                resultLabel.text = ""
                trackNumber -= 1
                if (trackNumber >= 1){
                    addButton.setTitle("Add", for: .normal)
                } else {
                    addButton.setTitle("Average", for: .normal)
                }
            }
        }
    }
    
    func getAverage()  {
        for number in arr {
            totalNumber += number
            resultLabel.text = "\(totalNumber / stepperValue)"
        }
    }
    
    func calculateAgain(){
        stepper.isEnabled = true
        addButton.setTitle("Add", for: .normal)
        arr = []
        trackNumber = 2
        totalNumber = 0
        stepperValue = 2
        stepperLabel.text = "2"
        resultLabel.text = ""
    }
    
    // MARK: Hidden Keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // the keyboard will disappear when user press return key
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // the keyboard will disappear when user press anywhere in screen
        self.view.endEditing(true)
    }
    
}

