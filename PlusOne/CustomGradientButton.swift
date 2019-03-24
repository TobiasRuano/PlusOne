//
//  CustomGradientButton.swift
//  PlusOne
//
//  Created by Tobias Ruano on 24/03/2019.
//  Copyright © 2019 Tobias Ruano. All rights reserved.
//

import UIKit

class CustomGradientButton: CustomButton {

    @IBInspectable var StartColor: UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var EndColor: UIColor = UIColor.clear{
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [StartColor.cgColor, EndColor.cgColor]
    }
    
}
