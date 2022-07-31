//
//  MainNavigationController.swift
//  apphw18-plant-app-nzmasadov
//
//  Created by Nazim Asadov on 24.07.22.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = MainVC()
        self.viewControllers = [vc]
//        navigationBar.isTranslucent = true
        navigationBar.isTranslucent = true
        navigationBar.barStyle = .default
        navigationBar.barTintColor = .white
        navigationBar.backgroundColor = .white
        navigationBar.tintColor = .black
    }
}
