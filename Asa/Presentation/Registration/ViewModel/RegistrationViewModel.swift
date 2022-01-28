//
//  RegistrationViewModel.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 20/01/22.
//

import Foundation
import SwiftyJSON
import Combine
import SwiftyUserDefaults

final class RegistrationViewModel {
    
    public weak var coordinator: RegistrationInterface?
    private var authUseCase: AuthUseCase?
    private var isRechable = CurrentValueSubject<Bool, Never>(false)
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    var alertMessage: PassthroughSubject<String, Never> = PassthroughSubject()
    
    var registrasiTitle = "juancug"
    
    init(coordinator: RegistrationInterface? = nil, authUseCase: AuthUseCase?) {
        self.coordinator = coordinator
        self.authUseCase = authUseCase

        if NetworkState().isInternetAvailable {
            isRechable.send(true)
        }
    }
}
