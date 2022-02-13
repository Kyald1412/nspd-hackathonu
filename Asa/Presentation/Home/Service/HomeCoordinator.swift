//
//  HomeCoordinator.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 27/01/22.
//

import Foundation
import Swinject

open class HomeCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    // MARK: - CoordinatorFinishOutput

    public var finishFlow: (() -> Void)?
    let container: Container

    // MARK: - Vars & Lets

    let navigationController: UINavigationController
    weak var delegate: HomeInterface?

    // MARK: - Coordinator

    public override func start() {
        showHome()
    }

    // MARK: - Init

    public init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }

//    // MARK: - Private methods
    
    private func showHome() {
        let viewController = container.resolveViewController(HomeScene.self)
        viewController.homeViewModel.coordinator = self
        
//        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
//        navigationController.navigationItem.backBarButtonItem = item
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.isHidden = true
//        navigationController.navigationBar.backItem?.backBarButtonItem = item
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func getTransplant() -> TransplantationListScene {
        let coordinator = TransplantationListCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        return coordinator.getTransplant()
    }
    
    func getRegistrationScene() -> RegistrationScene {
        let coordinator = RegistrationCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        return coordinator.getRegistration()
    }
    
    func getDetailScene() -> TransplantationDetailScene {
        let coordinator = TransplantationDetailCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        return coordinator.getTransplantationDetail()
    }
    
    private func showRegistartion(title: String) {
        let coordinator = RegistrationCoordinator(container: container, navigationController: navigationController)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start(registrasiTitle: title)
    }
    
}

protocol HomeInterface: AnyObject {
    func onBack()
    func goToRegistration(title: String)
    func registrationScene() -> RegistrationScene
    func transplantationScene() -> TransplantationListScene
    func detailScene() -> TransplantationDetailScene
}

extension HomeCoordinator: HomeInterface {
    func detailScene() -> TransplantationDetailScene {
        return getDetailScene()
    }
    
    func registrationScene() -> RegistrationScene {
        return getRegistrationScene()
    }
    
    func transplantationScene() -> TransplantationListScene {
        return getTransplant()
    }
    
    func onBack() {
        self.navigationController.popViewController(animated: true)
    }
    
    func goToRegistration(title: String) {
        showRegistartion(title: title)
    }
    
}

