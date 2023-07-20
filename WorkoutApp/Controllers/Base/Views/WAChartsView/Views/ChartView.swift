//
//  ChartView.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 20.07.2023.
//

import UIKit

final class ChartView: WABaseView {
    
    private let yAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    private let xAxisSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        layoutIfNeeded()
        addDashLines()
    }
}


extension ChartView {
    
    override func setupViews() {
        super.setupViews()
        
        setupView(xAxisSeparator)
        setupView(yAxisSeparator)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1),
            
            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1),
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

private extension ChartView {
    func addDashLines(with counts: Int? = nil) {
        (0..<9).map { CGFloat($0) }.forEach {
            addDashLine(at: bounds.height / 9 * $0)
        }
    }
    
    func addDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = R.Colors.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
    }
}
