//
//  SettingsViewController.swift
//  PlusOne
//
//  Created by Tobias Ruano on 1/3/18.
//  Copyright © 2018 Tobias Ruano. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var myGradientView: GradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.value(forKey: "StartColor") != nil {
            let startColor = UserDefaults.standard.colorForKey(key: "StartColor")
            let endColor = UserDefaults.standard.colorForKey(key: "EndColor")
            myGradientView.StartColor = startColor!
            myGradientView.EndColor = endColor!
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        counter = 0
        name = ""
        //Taptic feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        self.dismiss(animated: true, completion: nil)
    }
    
    // Change the background Color
    @IBAction func ColorOneButton(_ sender: UIButton) {
        myGradientView.StartColor = UIColor(displayP3Red: 128/255, green: 195/255, blue: 243/255, alpha: 1.0)
        myGradientView.EndColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1.0)
        UserDefaults.standard.setColor(color: myGradientView.StartColor, forKey: "StartColor")
        UserDefaults.standard.setColor(color: myGradientView.EndColor, forKey: "EndColor")
    }
    @IBAction func ColorTwoButton(_ sender: UIButton) {
        myGradientView.StartColor = UIColor(displayP3Red: 181/255, green: 235/255, blue: 69/255, alpha: 1.0)
        myGradientView.EndColor = UIColor(displayP3Red: 126/255, green: 211/255, blue: 33/255, alpha: 1.0)
        UserDefaults.standard.setColor(color: myGradientView.StartColor, forKey: "StartColor")
        UserDefaults.standard.setColor(color: myGradientView.EndColor, forKey: "EndColor")
    }
    @IBAction func ColorThreeButton(_ sender: UIButton) {
        myGradientView.StartColor = UIColor(displayP3Red: 224/255, green: 36/255, blue: 242/255, alpha: 1.0)
        myGradientView.EndColor = UIColor(displayP3Red: 189/255, green: 16/255, blue: 224/255, alpha: 1.0)
        UserDefaults.standard.setColor(color: myGradientView.StartColor, forKey: "StartColor")
        UserDefaults.standard.setColor(color: myGradientView.EndColor, forKey: "EndColor")
    }
    @IBAction func ColorFourButton(_ sender: UIButton) {
        myGradientView.StartColor = UIColor(displayP3Red: 250/255, green: 217/255, blue: 97/255, alpha: 1.0)
        myGradientView.EndColor = UIColor(displayP3Red: 247/255, green: 107/255, blue: 28/255, alpha: 1.0)
        UserDefaults.standard.setColor(color: myGradientView.StartColor, forKey: "StartColor")
        UserDefaults.standard.setColor(color: myGradientView.EndColor, forKey: "EndColor")
    }
    @IBAction func OtiginalcolorButton(_ sender: UIButton) {
        myGradientView.StartColor = UIColor(displayP3Red: 48/255, green: 35/255, blue: 174/255, alpha: 1.0)
        myGradientView.EndColor = UIColor(displayP3Red: 200/255, green: 109/255, blue: 215/255, alpha: 1.0)
        UserDefaults.standard.setColor(color: myGradientView.StartColor, forKey: "StartColor")
        UserDefaults.standard.setColor(color: myGradientView.EndColor, forKey: "EndColor")
    }
    
}

extension UserDefaults {
    func colorForKey(key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        return color
    }
    
    func setColor(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
        }
        set(colorData, forKey: key)
    }
    
}
