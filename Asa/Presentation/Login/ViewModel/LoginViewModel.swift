//
//  LoginViewModel.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 13/01/22.
//

import Foundation
import SwiftyJSON
import Combine
import SwiftyUserDefaults

final class LoginViewModel {
    
    public weak var coordinator: LoginInteface?
    private var authUseCase: AuthUseCase?
    private var isRechable = CurrentValueSubject<Bool, Never>(false)
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    var alertMessage: PassthroughSubject<String, Never> = PassthroughSubject()
    
    init(coordinator: LoginInteface? = nil, authUseCase: AuthUseCase?) {
        self.coordinator = coordinator
        self.authUseCase = authUseCase

        if NetworkState().isInternetAvailable {
            isRechable.send(true)
        }
    }
    
    func fetchLogin(email: String, password: String){
        
        self.isLoading.send(true)
        
        self.authUseCase?.executeFetchLogin(email: email, password: password, deviceId: "", referral: "ios") { UserData in
            //No cached required
            self.isLoading.send(false)
            
            print("USER DATA \(UserData)")
            
        } completion: { result in
            switch result {
            case .success(let response):
                print("success \(response)")
            case .failure(let error):
                self.isLoading.send(false)
                self.alertMessage.send(error.localizedDescription)
                print("Failure \(error)")
            }
        }
    }
    
    func goToRegistration() {
        self.coordinator?.goToRegistration(title: "Registrasi")
    }
    
}
