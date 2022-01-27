//
//  HomeViewModel.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 27/01/22.
//

import Foundation
import SwiftyJSON
import Combine
import SwiftyUserDefaults

final class HomeViewModel {
    
    public weak var coordinator: HomeInterface?
    private var isRechable = CurrentValueSubject<Bool, Never>(false)
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    var alertMessage: PassthroughSubject<String, Never> = PassthroughSubject()
    
    init(coordinator: HomeInterface? = nil) {
        self.coordinator = coordinator

        if NetworkState().isInternetAvailable {
            isRechable.send(true)
        }
    }
    
//    func goToRegistration() {
//        self.coordinator?.goToRegistration(title: "Registrasi")
//    }
    
}


//final class LoginViewModel {
//
//    public weak var coordinator: LoginInteface?
//    private var authUseCase: AuthUseCase?
//    private var isRechable = CurrentValueSubject<Bool, Never>(false)
//
//    var isLoading = CurrentValueSubject<Bool, Never>(false)
//    var alertMessage: PassthroughSubject<String, Never> = PassthroughSubject()
//
//    init(coordinator: LoginInteface? = nil, authUseCase: AuthUseCase?) {
//        self.coordinator = coordinator
//        self.authUseCase = authUseCase
//
//        if NetworkState().isInternetAvailable {
//            isRechable.send(true)
//        }
//    }
//
//
//    func goToRegistration() {
//        self.coordinator?.goToRegistration(title: "Registrasi")
//    }
//
//}

