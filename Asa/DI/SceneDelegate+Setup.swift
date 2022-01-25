//
//  SceneDelegate+Setup.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 31/10/21.
//

import Swinject
import SwinjectAutoregistration
import Moya

extension SceneDelegate {
    
    internal func setupDependencies() {
        setupProvider()
        setupViewModel()
        setupViewController()
    }
    
    // MARK: - Providers
    internal func setupProvider() {
        container.register(AuthUseCase.self) { _ in
            DIService.authUseCase
        }
    }
    
    // MARK: - View Model
    internal func setupViewModel() {
        container.register(LoginViewModel.self) { r in
            LoginViewModel(authUseCase: r.resolve(AuthUseCase.self))
        }
        container.register(RegistrationViewModel.self) { r in
            RegistrationViewModel(authUseCase: r.resolve(AuthUseCase.self))
        }
        //ini trasnplantation list ga pake authcase karena emg gabutuh keknya
        container.register(TransplantationListViewModel.self) { r in
            TransplantationListViewModel()
        }
    }
    
    // MARK: - View Controllers
    internal func setupViewController() {
        container.storyboardInitCompleted(LoginScene.self) { resolver, controller in
            controller.loginViewModel = resolver.resolve(LoginViewModel.self)
        }
        container.storyboardInitCompleted(RegistrationScene.self) { resolver, controller in
            controller.registrationViewModel = resolver.resolve(RegistrationViewModel.self)
        }
        container.storyboardInitCompleted(TransplantationListScene.self) { resolver, controller in
            controller.transplantationListViewModel = resolver.resolve(TransplantationListViewModel.self)
        }
    }
    
}
