//
//  CustomLabel.swift
//  25. დავალება - Animations - ანიმაციები
//
//  Created by gvantsa gvagvalia on 5/11/24.
//

import UIKit

class CustomLabel: UILabel {
    class LeftAlignedCustomLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            configureLabel()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            fatalError("init(coder:) has not been implemented")
        }
        
        func configureLabel() {
            translatesAutoresizingMaskIntoConstraints = false
            textAlignment = .center
            textColor = .label
            numberOfLines = 0
        }
    }
    
}
