//
//  CustomSpinningView.swift
//  25. დავალება - Animations - ანიმაციები
//
//  Created by gvantsa gvagvalia on 5/11/24.
//

import UIKit

class CustomSpinningView: UIView {
    
    let loadingView = CAShapeLayer()
    var isAnimating = false
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        loadingView.path = circularPath.cgPath
        loadingView.fillColor = UIColor.clear.cgColor
        loadingView.strokeColor = UIColor.systemBlue.cgColor
        loadingView.lineWidth = 10
        loadingView.strokeEnd = 0.25
        loadingView.lineCap = .round
        self.layer.addSublayer(loadingView)
    }
    func startAnimation() {
        guard !isAnimating else { return }
        isAnimating = true
        animate()
    }
    
    func stopAnimation() {
        isAnimating = false
    }
    
    private func animate() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        }) { (completed) in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.transform = CGAffineTransform(rotationAngle: 0)
            }) { (completed) in
                if self.isAnimating {
                    self.animate()
                }
            }
        }
    }
}
