//
//  LoginScene.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 13/01/22.
//

import Foundation
import UIKit
import Combine

class LoginScene: UIViewController, SceneStoryboardLoadable {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginVM: LoginViewModel!
    private var cancellables = Set<AnyCancellable>()
    private var loadingView: LoadingView!
    
    @IBAction func registrasiPressed(_ sender: Any) {
        self.loginVM.goToRegistration()
    }
    
    @IBAction func masukPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            loginVM.provider.request(.login(loginRequest: LoginRequest(email: email,
                                                                       password: password,
                                                                       deviceId: "asdhaskdgasdhaskj"))) {result in
                switch result {
                case .success(let response):
                    print("succes oh yeah")
                    do {
                        let dataError = try JSONDecoder().decode(ErrorResponse.self, from: response.data)
                        let message = dataError.message
                        print(message)
                    } catch {
                        print("fail decoding error messages")
                    }
                case .failure(let error):
                    print("fail oh no")
                    do {
                        let dataError = try JSONDecoder().decode(ErrorResponse.self, from: error.response!.data)
                        let message = dataError.message
                        print(message)
                    } catch {
                        print("fail decoding error messages")
                    }
                    
                    
                }
              }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //        loadingView = LoadingView(uiView: self.view, message: "")
        
        setupView()
        setupViewModel()
        self.title = L10n.login
    }
    
    @IBAction func revealPressed(_ sender: Any) {
        (passwordTextField.isSecureTextEntry) ? (passwordTextField.isSecureTextEntry = false) : (passwordTextField.isSecureTextEntry = true)
    }
    
    func setupView() {
        passwordTextField.isSecureTextEntry = true
    }
    func setupViewModel(){
        //        loginViewModel.alertMessage.sink { message in
        //            self.showMessage(message: message)
        //        }.store(in: &cancellables)
        //
        //        loginViewModel.isLoading.sink { isLoading in
        //
        //            if isLoading {
        //                self.loadingView.show()
        //            } else {
        //                self.loadingView.hide()
        //            }
        //
        //        }.store(in: &cancellables)
        //
        //        loginViewModel.isLoggedIn.sink { isLoggedIn in
        //            if isLoggedIn {
        //                self.delegate?.onHomeView()
        //            }
        //        }.store(in: &cancellables)
        
        
    }
}
