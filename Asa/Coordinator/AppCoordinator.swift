//
//  AppCoordinator.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 24/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Swinject
import UIKit
import SwiftyUserDefaults

final class AppCoordinator: BaseCoordinator {
    // MARK: - Properties
    
    private let window: UIWindow
    let container: Container
    let isLoggedIn = Defaults[\.isLoggedIn]
    
    var navigationController: UINavigationController

    // MARK: - Flow Coordinator
    
    func getCurrentFlow() -> UIViewController {
        return navigationController.viewControllers[0]
    }
    
    func getCurrentCoordinator() -> Coordinator {
        return childCoordinators[0]
    }
    
    // MARK: - Init
    override func start() {
//        if isLoggedIn {
//            runLoginFlow()
//        runTransplantationListFlow()
        runHomeFlow()
//        } else {
//            runLoginFlow()
//        }
    }
    
    init(window: UIWindow, container: Container, navigationController: UINavigationController) {
        self.window = window
        self.container = container
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = false
        self.navigationController.navigationBar.tintColor = .white
        self.navigationController.navigationBar.barTintColor = .white
        self.navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController.navigationBar.shadowImage = UIImage()
        self.navigationController.navigationBar.isTranslucent = true
        self.navigationController.interactivePopGestureRecognizer?.isEnabled = false
        self.window.rootViewController = navigationController
    }
}
