//
//  LoginCoordinator.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 13/01/22.
//

import Foundation
import Swinject

open class LoginCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    // MARK: - CoordinatorFinishOutput

    public var finishFlow: (() -> Void)?
    let container: Container

    // MARK: - Vars & Lets

    let navigationController: UINavigationController
    weak var delegate: LoginInteface?

    // MARK: - Coordinator

    public override func start() {
        showLogin()
    }

    // MARK: - Init

    public init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }

    // MARK: - Private methods
    func getLogin() -> LoginScene{
        let viewController = container.resolveViewController(LoginScene.self)
        return viewController
    }
    
    private func showLogin() {
        let viewController = container.resolveViewController(LoginScene.self)
        viewController.loginViewModel.coordinator = self
        
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationController.navigationItem.backBarButtonItem = item
        navigationController.isNavigationBarHidden = false
        navigationController.navigationBar.isHidden = false
        navigationController.navigationBar.backItem?.backBarButtonItem = item
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func showHomeView(){
//        let coordinator = HomeCoordinator(container: container, navigationController: navigationController)
//        coordinator.finishFlow = { [unowned self, unowned coordinator] in
//            self.removeDependency(coordinator)
//            self.start()
//        }
//        addDependency(coordinator)
//        coordinator.start()
    }
}

protocol LoginInteface: AnyObject {
    func onBack()
    func onHomeView()
}

extension LoginCoordinator: LoginInteface {
    
    func onBack() {
        self.navigationController.popViewController(animated: true)
    }
    
    func onHomeView(){
        showHomeView()
    }
    
}
