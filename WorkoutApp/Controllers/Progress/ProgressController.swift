//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 08.07.2023.
//

import UIKit

class ProgressController: WABaseController {
    
    private let dailyPerformanceView = DailyPerformanceView(with: R.Strings.Progress.dailyPerformance,
                                                        buttonTitle: R.Strings.Progress.last7Days.uppercased())
    
    private let monthlyPerformanceView = MonthlyPerformanceView(with: R.Strings.Progress.monthlyPerformance,
                                                        buttonTitle: R.Strings.Progress.last10Months.uppercased())

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProgressController {
    
    override func setupViews() {
        super.setupViews()
    
        view.setupView(dailyPerformanceView)
        view.setupView(monthlyPerformanceView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor,
                                                         multiplier: 0.68),
    
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor,
                                                           multiplier: 1.06),
            
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        dailyPerformanceView.configure(with: [
            .init(value: "1", heightMultiplier: 0.2, title: "MON"),
            .init(value: "2", heightMultiplier: 0.4, title: "TEU"),
            .init(value: "3", heightMultiplier: 0.6, title: "WEN"),
            .init(value: "4", heightMultiplier: 0.8, title: "THU"),
            .init(value: "5", heightMultiplier: 1, title: "FRI"),
            .init(value: "3", heightMultiplier: 0.6, title: "SAT"),
            .init(value: "2", heightMultiplier: 0.4, title: "SUN"),
        ])
        
        monthlyPerformanceView.configure(with: [
            .init(value: 45, title: "Mar"),
            .init(value: 55, title: "Apr"),
            .init(value: 60, title: "May"),
            .init(value: 65, title: "Jun"),
            .init(value: 70, title: "Jul"),
            .init(value: 80, title: "Aug"),
            .init(value: 65, title: "Sep"),
            .init(value: 45, title: "Oct"),
            .init(value: 30, title: "Nov"),
            .init(value: 15, title: "Dec"),
        ], topChartOffset: 10)
    }
}
