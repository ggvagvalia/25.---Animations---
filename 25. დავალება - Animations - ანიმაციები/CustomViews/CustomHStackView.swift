//
//  CustomHStackView.swift
//  25. დავალება - Animations - ანიმაციები
//
//  Created by gvantsa gvagvalia on 5/11/24.
//

import UIKit

class CustomHStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        spacing = 10
        distribution = .fillProportionally
    }
}
