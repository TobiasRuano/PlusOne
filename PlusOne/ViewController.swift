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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = String(counter)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        numberLabel.text = String(counter)
        nameLabel.text = name
        if UserDefaults.standard.value(forKey: "StartColor") != nil {
            let startColor = UserDefaults.standard.colorForKey(key: "StartColor")
            let endColor = UserDefaults.standard.colorForKey(key: "EndColor")
            myGradientView.StartColor = startColor!
            myGradientView.EndColor = endColor!
        }
        else {
            myGradientView.StartColor = UIColor(displayP3Red: 48/255, green: 35/255, blue: 174/255, alpha: 1.0)
            myGradientView.EndColor = UIColor(displayP3Red: 200/255, green: 109/255, blue: 215/255, alpha: 1.0)
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
        //Taptic feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    @IBAction func MinusButton(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            numberLabel.text = String(counter)
            //Taptic feedback
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }else {
            //Taptic feedback
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
    }
    
    func createAlert(tittle: String, message: String){
        
        let alert = UIAlertController(title: tittle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated:  true, completion: nil)
    }
    
    
    func user() -> String {
        var tField: UITextField!
        
        func configurationTextField(textField: UITextField!)
        {
            print("generating the TextField")
            textField.placeholder = "Enter an item"
            textField.textAlignment = .center
            tField = textField
        }
        
        func handleCancel(alertView: UIAlertAction!)
        {
            print("Cancelled !!")
        }
        
        let alert = UIAlertController(title: "What do you need to count?", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: configurationTextField)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler:{ (UIAlertAction) in
            print("Done !!")
            
            print("Item : \(String(describing: tField.text))")
            name = tField.text!
            if name != "" {
             self.nameLabel.text = name
            }else {
                name = "🙈"
                self.nameLabel.text = name
            }
            
            //Guardo el nombre
//            UserDefaults.standard.set(self.nombre, forKey: "name")
            
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
        print(name)
        
        if tField.text == nil {
            return "No value"
        }else{
            return (tField.text!)
        }
    }
    
    @IBAction func settingsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    
}

