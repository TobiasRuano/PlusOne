//
//  GradientView.swift
//  PlusOne
//
//  Created by Tobias Ruano on 2/3/18.
//  Copyright © 2018 Tobias Ruano. All rights reserved.
//

import UIKit

@IBDesignable

class GradientView: UIView {
    
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

