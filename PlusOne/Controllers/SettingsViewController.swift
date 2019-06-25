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
    @IBOutlet weak var originalButtonStyle: UIButton!
    @IBOutlet weak var colorOneButtonStyle: UIButton!
    @IBOutlet weak var colorTwoButtonStyle: UIButton!
    @IBOutlet weak var colorThreeButtonStyle: UIButton!
    @IBOutlet weak var colorFourButtonStyle: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.value(forKey: "StartColor") != nil {
            let startColor = UserDefaults.standard.colorForKey(key: "StartColor")
            let endColor = UserDefaults.standard.colorForKey(key: "EndColor")
            let value = UserDefaults.standard.value(forKey: "ButtonValue")
            myGradientView.StartColor = startColor!
            myGradientView.EndColor = endColor!
            enableButton(value: value as! Int)
        }else {
            enableButton(value: 5)
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        counter = 0
        name = ""
        TapticEffectsService.performFeedbackNotification(type: .success)
        self.dismiss(animated: true, completion: nil)
    }
    
    func enableButton(value: Int) {
        switch value {
        case 1:
            buttonIsEnable(colorOneButtonStyle, colorTwoButtonStyle, colorThreeButtonStyle, colorFourButtonStyle, originalButtonStyle)
        case 2:
            buttonIsEnable(colorTwoButtonStyle, colorOneButtonStyle, colorThreeButtonStyle, colorFourButtonStyle, originalButtonStyle)
        case 3:
            buttonIsEnable(colorThreeButtonStyle, colorOneButtonStyle, colorTwoButtonStyle, colorFourButtonStyle, originalButtonStyle)
        case 4:
            buttonIsEnable(colorFourButtonStyle, colorOneButtonStyle, colorTwoButtonStyle, colorThreeButtonStyle, originalButtonStyle)
        default:
            buttonIsEnable(originalButtonStyle, colorOneButtonStyle, colorTwoButtonStyle, colorThreeButtonStyle, colorFourButtonStyle)
        }
    }
    
    func buttonIsEnable(_ disabled: UIButton, _ enabled1: UIButton, _ enabled2: UIButton, _ enabled3: UIButton, _ enabled4: UIButton) {
        disabled.isEnabled = false
        
        enabled1.isEnabled = true
        enabled1.isHidden = false
        
        enabled2.isEnabled = true
        enabled2.isHidden = false
        
        enabled3.isEnabled = true
        enabled3.isHidden = false
        
        enabled4.isEnabled = true
        enabled4.isHidden = false
    }
    
    // Change the background Color
    @IBAction func ColorOneButton(_ sender: UIButton) {
        setColorBackground(start: UIColor(named: "BlueStart")!, finish: UIColor(named: "BlueFinish")!, value: 1)
    }
    @IBAction func ColorTwoButton(_ sender: UIButton) {
        setColorBackground(start: UIColor(named: "GreenStart")!, finish: UIColor(named: "GreenFinish")!, value: 2)
    }
    @IBAction func ColorThreeButton(_ sender: UIButton) {
        setColorBackground(start: UIColor(named: "PinkStart")!, finish: UIColor(named: "PinkFinish")!, value: 3)
    }
    @IBAction func ColorFourButton(_ sender: UIButton) {
        setColorBackground(start: UIColor(named: "OrangeStart")!, finish: UIColor(named: "OrangeFinish")!, value: 4)
    }
    @IBAction func OriginalcolorButton(_ sender: UIButton) {
        setColorBackground(start: UIColor(named: "VioletStart")!, finish: UIColor(named: "VioletFinish")!, value: 5)
    }
    
    func setColorBackground(start: UIColor, finish: UIColor, value: Int) {
        myGradientView.StartColor = start
        myGradientView.EndColor = finish
        UserDefaults.standard.setColor(color: myGradientView.StartColor, forKey: "StartColor")
        UserDefaults.standard.setColor(color: myGradientView.EndColor, forKey: "EndColor")
        UserDefaults.standard.set(value, forKey: "ButtonValue")
        enableButton(value: value)
        TapticEffectsService.performFeedbackNotification(type: .success)
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
