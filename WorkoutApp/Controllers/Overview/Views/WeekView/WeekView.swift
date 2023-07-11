//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 10.07.2023.
//

import UIKit

final class WeekView: BaseView {
    
//    private let calendar = Calendar.current
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 7
        view.distribution = .fillEqually
        return view
    }()
}


extension WeekView {
    
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        var weekdays = Date.calendar.shortStandaloneWeekdaySymbols
        
        if Date.calendar.firstWeekday == 2 {
            let sunday = weekdays.remove(at: 0)
            weekdays.append(sunday)
        }
        
        weekdays.enumerated().forEach { index, name in
            let view = WeekdayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
}
