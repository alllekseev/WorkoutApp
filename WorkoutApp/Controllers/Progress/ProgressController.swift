//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Олег Алексеев on 08.07.2023.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Resources.Strings.NavBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.progress
        
        addNavBarButton(at: .left, with: Resources.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Progress.navBarRight)
    }

    override func navBarLeftButtonHandler() {
        print("Progress Navbar Tappped")
    }
}
