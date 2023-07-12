//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 08.07.2023.
//

import UIKit

class SessionController: WABaseController {
    
    private let timerView = TimerView()
    
    private let timerDuration = 3.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStoped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStoped : .isRunning
        addNavBarButton(
            at: .left,
            with: timerView.state == .isRunning
            ? R.Strings.Session.navBarPause : R.Strings.Session.navBarStart)
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStoped
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)    }
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            //            timerView.heightAnchor.constraint(equalToConstant: 500)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
    }
}
