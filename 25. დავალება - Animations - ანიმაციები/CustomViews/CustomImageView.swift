//
//  CustomImageView.swift
//  25. დავალება - Animations - ანიმაციები
//
//  Created by gvantsa gvagvalia on 5/10/24.
//

import UIKit


class CustomImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 10
        contentMode = .scaleAspectFill
        image = UIImage(named: "coverPhoto")
    }
    
}

