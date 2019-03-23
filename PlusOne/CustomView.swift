//
//  CustomView.swift
//  PlusOne
//
//  Created by Tobias Ruano on 23/03/2019.
//  Copyright © 2019 Tobias Ruano. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setStyle()
    }
    
    func setStyle() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 15
        layer.shadowOpacity = 20
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
}
