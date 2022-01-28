//
//  TransplantationDetailCoordinator.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 22/01/22.
//

import Foundation
import Swinject

open class TransplantationDetailCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    // MARK: - CoordinatorFinishOutput

    public var finishFlow: (() -> Void)?
    let container: Container

    // MARK: - Vars & Lets

    let navigationController: UINavigationController
    weak var delegate: TransplantationDetailInterface?

    // MARK: - Coordinator

    public override func start() {
        showTransplantationDetail()
    }

    // MARK: - Init

    public init(container: Container, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    
//    // MARK: - Private methods
    
    func getTransplantationDetail() -> TransplantationDetailScene{
        let viewController = container.resolveViewController(TransplantationDetailScene.self)
        return viewController
    }

    private func showTransplantationDetail() {
        let viewController = container.resolveViewController(TransplantationDetailScene.self)
        viewController.transplantationDetailViewModel.coordinator = self
        
//        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
//        navigationController.navigationItem.backBarButtonItem = item
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.isHidden = true
//        navigationController.navigationBar.backItem?.backBarButtonItem = item
        navigationController.pushViewController(viewController, animated: true)
    }
}


protocol TransplantationDetailInterface: AnyObject {
    func onBack()
}

extension TransplantationDetailCoordinator: TransplantationDetailInterface {
    func onBack() {
        self.navigationController.popViewController(animated: true)
    }
    
//    func goToRegistration(title: String){
//        showRegistartion(title: title)
//    }
    
}

