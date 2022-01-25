//
//  TransplantationListCoordinator.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 22/01/22.
//

import Foundation
import Swinject

open class TransplantationListCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    // MARK: - CoordinatorFinishOutput

    public var finishFlow: (() -> Void)?
    let container: Container

    // MARK: - Vars & Lets

    let navigationController: UINavigationController
    weak var delegate: TransplantationListInterface?

    // MARK: - Coordinator

    public override func start() {
        showTransplantationList()
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
    
    private func showTransplantationList() {
        let viewController = container.resolveViewController(TransplantationListScene.self)
        viewController.transplantationListViewModel.coordinator = self
        
//        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
//        navigationController.navigationItem.backBarButtonItem = item
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.isHidden = true
//        navigationController.navigationBar.backItem?.backBarButtonItem = item
        navigationController.pushViewController(viewController, animated: true)
    }
}


protocol TransplantationListInterface: AnyObject {
    func onBack()
}

extension TransplantationListCoordinator: TransplantationListInterface {
    func onBack() {
        self.navigationController.popViewController(animated: true)
    }
    
//    func goToRegistration(title: String){
//        showRegistartion(title: title)
//    }
    
}

