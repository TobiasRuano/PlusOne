//
//  CustomButton.swift
//  PlusOne
//
//  Created by Tobias Ruano on 23/03/2019.
//  Copyright © 2019 Tobias Ruano. All rights reserved.
//

import UIKit

@IBDesignable

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setStyle()
    }
    
    override var isHighlighted: Bool {
        didSet {
            layer.shadowOpacity = isHighlighted ? 0 : 1
        }
    }

    func setStyle() {
        let color = UIColor(displayP3Red: 128/255, green: 195/255, blue: 243/255, alpha: 1)
        setTitleColor(color , for: .normal)
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }

}
