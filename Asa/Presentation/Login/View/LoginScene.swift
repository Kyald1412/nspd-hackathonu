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
        
    var loginViewModel: LoginViewModel!
    private var cancellables = Set<AnyCancellable>()
    private var loadingView: LoadingView!

    @IBAction func asd(_ sender: Any) {
        
    }
    
    @IBAction func registrasiPressed(_ sender: Any) {
        self.loginViewModel.goToRegistration()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadingView = LoadingView(uiView: self.view, message: "")

        setupViewModel()
        self.title = L10n.login
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
