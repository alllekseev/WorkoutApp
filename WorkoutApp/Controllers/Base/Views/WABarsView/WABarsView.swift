//
//  WABarsView.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 17.07.2023.
//

import UIKit

final class WABarsView: WABaseView {
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WABarView.Data]) {
        data.forEach {
            let barView = WABarView(data: $0)
            stackView.addArrangedSubview(barView)
        }
    }
}

extension WABarsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}
