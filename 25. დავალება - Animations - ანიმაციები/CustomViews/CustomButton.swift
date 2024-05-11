//
//  CustomButton.swift
//  25. დავალება - Animations - ანიმაციები
//
//  Created by gvantsa gvagvalia on 5/11/24.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func configureButton() {
        
        translatesAutoresizingMaskIntoConstraints = false
        //        setTitleColor(.white, for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        setPreferredSymbolConfiguration(config, forImageIn: .normal)
        setImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = .white
        backgroundColor = .red
        layer.cornerRadius = 20
        sizeToFit()
    }
    
    
}
