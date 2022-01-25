//
//  TransplantationListViewModel.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 22/01/22.
//

import Foundation
import SwiftyJSON
import Combine
import SwiftyUserDefaults

final class TransplantationListViewModel {
    
    public weak var coordinator: TransplantationListInterface?
//    private var authUseCase: AuthUseCase?
    private var isRechable = CurrentValueSubject<Bool, Never>(false)
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    var alertMessage: PassthroughSubject<String, Never> = PassthroughSubject()
    
    init(coordinator: TransplantationListInterface? = nil) {
        self.coordinator = coordinator

        if NetworkState().isInternetAvailable {
            isRechable.send(true)
        }
    }
    
//    func goToRegistration() {
//        self.coordinator?.goToRegistration(title: "Registrasi")
//    }
    
}

