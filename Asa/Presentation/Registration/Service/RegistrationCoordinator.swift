//
//  RegisterCoordinator.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 20/01/22.
//

import Foundation
import Swinject

open class RegistrationCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    // MARK: - CoordinatorFinishOutput

    public var finishFlow: (() -> Void)?
    let container: Container

    // MARK: - Vars & Lets

    let navigationController: UINavigationController
    weak var delegate: RegistrationInterface?


    // MARK: - Coordinator

//    public override func start() {
//        showRegistration()
//    }
    
    func start(registrasiTitle: String){
        showRegistration(registrasiTitle: registrasiTitle)
    }

    // MARK: - Init

    public init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }

//    // MARK: - Private methods
//    func getLogin() -> LoginScene{
//        let viewController = container.resolveViewController(LoginScene.self)
//        return viewController
//    }
    
    private func showRegistration(registrasiTitle: String) {
        let viewController = container.resolveViewController(RegistrationScene.self)
        viewController.registrationViewModel.coordinator = self
        viewController.registrationViewModel.registrasiTitle = registrasiTitle
        
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationController.navigationItem.backBarButtonItem = item
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.barTintColor = .black
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
    
    func getRegistration() -> RegistrationScene {
        let viewController = container.resolveViewController(RegistrationScene.self)
        return viewController
    }
}

protocol RegistrationInterface: AnyObject {
    func onBack()
}

extension RegistrationCoordinator: RegistrationInterface {
    
    func onBack() {
        self.navigationController.popViewController(animated: true)
    }
    
}
