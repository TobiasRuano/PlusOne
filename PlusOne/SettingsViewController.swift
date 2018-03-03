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
    
    var colorFondo: UIColor = UIColor.green
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        background.isHidden = true
//        colorFondo = UserDefaults.standard.colorForKey(key: "fondo")!
//        view.backgroundColor = colorFondo
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
    //TODO: function to change the background
    func changeBackground(color: UIColor) {
        view.backgroundColor = color
//        let homeVC = ViewController()
//        var homebackground =  homeVC.view.backgroundColor
//        homebackground = color
        colorFondo = color
        UserDefaults.standard.setColor(color: color, forKey: "fondo")
    }
    
    @IBOutlet weak var background: UIImageView!
    
    
    // Change the background Color
    @IBAction func ColorOneButton(_ sender: UIButton) {
        let color = UIColor(red: 128/255.0, green: 195/255.0, blue: 243/255.0, alpha: 1.0)
        changeBackground(color: color)
        
    }
    @IBAction func ColorTwoButton(_ sender: UIButton) {
        let color = UIColor(red: 128/255.0, green: 195/255.0, blue: 243/255.0, alpha: 1.0)
        changeBackground(color: color)
    }
    @IBAction func ColorThreeButton(_ sender: UIButton) {
        let color = UIColor(red: 224/255.0, green: 36/255.0, blue: 242/255.0, alpha: 1.0)
        changeBackground(color: color)
    }
    @IBAction func ColorFourButton(_ sender: UIButton) {
        let color = UIColor(red: 128/255.0, green: 195/255.0, blue: 243/255.0, alpha: 1.0)
        changeBackground(color: color)
    }
    @IBAction func OtiginalcolorButton(_ sender: Any) {
        let color = UIColor(red: 128/255.0, green: 195/255.0, blue: 243/255.0, alpha: 1.0)
        changeBackground(color: color)
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
