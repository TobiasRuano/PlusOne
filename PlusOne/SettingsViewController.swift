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
        enabled2.isEnabled = true
        enabled3.isEnabled = true
        enabled4.isEnabled = true
    }
    
    // Change the background Color
    @IBAction func ColorOneButton(_ sender: UIButton) {
        setColorBackground(redStart: 128, greenStart: 195, blueStart: 243, redFinish: 74, greenFinish: 144, blueFinish: 226, value: 1)
    }
    @IBAction func ColorTwoButton(_ sender: UIButton) {
        setColorBackground(redStart: 181, greenStart: 235, blueStart: 69, redFinish: 126, greenFinish: 211, blueFinish: 33, value: 2)
    }
    @IBAction func ColorThreeButton(_ sender: UIButton) {
        setColorBackground(redStart: 224, greenStart: 36, blueStart: 242, redFinish: 189, greenFinish: 16, blueFinish: 224, value: 3)
    }
    @IBAction func ColorFourButton(_ sender: UIButton) {
        setColorBackground(redStart: 250, greenStart: 217, blueStart: 97, redFinish: 247, greenFinish: 107, blueFinish: 28, value: 4)
    }
    @IBAction func OtiginalcolorButton(_ sender: UIButton) {
        setColorBackground(redStart: 48, greenStart: 35, blueStart: 174, redFinish: 200, greenFinish: 109, blueFinish: 215, value: 5)
    }
    
    func setColorBackground(redStart: CGFloat, greenStart: CGFloat, blueStart: CGFloat, redFinish: CGFloat, greenFinish: CGFloat, blueFinish: CGFloat, value: Int) {
        myGradientView.StartColor = UIColor(displayP3Red: redStart/255, green: greenStart/255, blue: blueStart/255, alpha: 1.0)
        myGradientView.EndColor = UIColor(displayP3Red: redFinish/255, green: greenFinish/255, blue: blueFinish/255, alpha: 1.0)
        UserDefaults.standard.setColor(color: myGradientView.StartColor, forKey: "StartColor")
        UserDefaults.standard.setColor(color: myGradientView.EndColor, forKey: "EndColor")
        enableButton(value: value)
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
