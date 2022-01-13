//
//  BaseCoordinator.swift
//  Asa
//
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation
import Swinject

open class BaseCoordinator: Coordinator {
    // MARK: - Vars & Lets

    open var childCoordinators = [Coordinator]()

    // MARK: - Public methods

    open func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator {
                return
            }
        }
        childCoordinators.append(coordinator)
    }

    open func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else {
            return
        }

        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }


    public init() {}    // MARK: - Coordinator

    open func start() {}
}
