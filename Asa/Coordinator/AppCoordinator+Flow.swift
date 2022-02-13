//
//  AppCoordinator+Flow.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 24/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Swinject
import UIKit

extension AppCoordinator {
    // MARK: - Private methods
    
    func runLoginFlow() {
        let coordinator = LoginCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func runRegistrationFlow() {
        let coordinator = RegistrationCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func runTransplantationListFlow() {
        let coordinator = TransplantationListCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func runHomeFlow() {
        let coordinator = HomeCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func runTransplantationDetailFlow() {
        let coordinator = TransplantationDetailCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
