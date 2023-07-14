//
//  WABaseView.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 10.07.2023.
//

import UIKit

class WABaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension WABaseView {
    func setupViews() {}
    func constraintViews() {}
    func configureAppearance() {}
}
