//
//  RegistrationScene.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 20/01/22.
//

import UIKit
import Combine
import Closures

class RegistrationScene: UIViewController, SceneStoryboardLoadable {
    
    var registrationViewModel: RegistrationViewModel!
    private var cancellables = Set<AnyCancellable>()
    private var loadingView: LoadingView!
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadingView = LoadingView(uiView: self.view, message: "")

        setupViewModel()
        setupView()
        
        self.title = registrationViewModel.registrasiTitle
    }
    
    func setupView() {
        btnBack.onTap {
            self.registrationViewModel.coordinator?.onBack()
        }
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
