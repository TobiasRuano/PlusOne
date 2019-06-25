//
//  ViewController.swift
//  PlusOne
//
//  Created by Tobias Ruano on 1/3/18.
//  Copyright © 2018 Tobias Ruano. All rights reserved.
//

import UIKit

var counter = 0
var name = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var myGradientView: GradientView!
    @IBOutlet weak var nameView: CustomView!
    @IBOutlet weak var numberView: CustomView!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = String(counter)
        settingsButton.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        numberLabel.text = String(counter)
        nameLabel.text = name
        setBackgroundColor()
    }
    
    
    func setBackgroundColor() {
        if UserDefaults.standard.value(forKey: "StartColor") != nil {
            let startColor = UserDefaults.standard.colorForKey(key: "StartColor")
            let endColor = UserDefaults.standard.colorForKey(key: "EndColor")
            myGradientView.StartColor = startColor!
            myGradientView.EndColor = endColor!
        }
        else {
            myGradientView.StartColor = UIColor(named: "VioletStart")!
            myGradientView.EndColor = UIColor(named: "VioletFinish")!
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if name == "" {
            if numberLabel.text == String(0) {
                name = user()
                nameLabel.text = name
            }
        }
    }

    @IBAction func PlusButton(_ sender: UIButton) {
        counter += 1
        numberLabel.text = String(counter)
        TapticEffectsService.performFeedbackImpact(style: .light)
    }
    
    @IBAction func MinusButton(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            numberLabel.text = String(counter)
            TapticEffectsService.performFeedbackImpact(style: .light)
        }else {
            TapticEffectsService.performFeedbackNotification(type: .warning)
        }
    }
    
    func createAlert(tittle: String, message: String) {
        
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in alert.dismiss(animated: true)
        }))
        
        self.present(alert, animated:  true, completion: nil)
    }
    
    func user() -> String {
        var tField: UITextField!
        
        func configurationTextField(textField: UITextField!) {
            textField.placeholder = "Enter an item"
            textField.autocapitalizationType = .sentences
            textField.textAlignment = .center
            tField = textField
        }
        
        let alert = UIAlertController(title: "What do you need to count?", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{ (UIAlertAction) in
            
            print("Item : \(String(describing: tField.text))")
            name = tField.text!
            if name != "" {
             self.nameLabel.text = name
            } else {
                name = "🙈"
                self.nameLabel.text = name
            }
        }))
        self.present(alert, animated: true)
        
        if tField.text == nil {
            return "No value"
        }else {
            return (tField.text!)
        }
    }
    
    @IBAction func settingsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

