//
//  UIView + ext.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 08.07.2023.
//

import UIKit

extension UIView {
    // TODO: rename parameters
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        
        addSubview(separator)
    }
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchDragOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.45 }
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
}
