//
//  WAChartsView.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 19.07.2023.
//

import UIKit

final class WAChartsView: WABaseView {
    
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    private let chartView = ChartView()
    
    func configure(with data: [WAChartsView.Data]) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        chartView.configure(with: data)
    }
}

extension WAChartsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 8),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),
            
            chartView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

extension WAChartsView {
    struct Data {
        let value: Int
        let title: String
    }
}
