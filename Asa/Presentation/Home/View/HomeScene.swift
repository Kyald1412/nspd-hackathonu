//
//  HomeScene.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 27/01/22.
//

import UIKit
import Combine

class HomeScene: UITabBarController, SceneStoryboardLoadable, UITabBarControllerDelegate {
    
    var homeViewModel: HomeViewModel!
    private var cancellables = Set<AnyCancellable>()
    private var loadingView: LoadingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Create Tab one
        let tabOne = self.homeViewModel.coordinator?.registrationScene()
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))

        tabOne?.tabBarItem = tabOneBarItem


        // Create Tab two
        let tabTwo = self.homeViewModel.coordinator?.trasncplationScene()
        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))

        tabTwo?.tabBarItem = tabTwoBarItem2

        self.viewControllers = [tabOne!, tabTwo!]
    }
}



//class LoginScene: UITabBarController, SceneStoryboardLoadable, UITabBarControllerDelegate {

//    var loginViewModel: LoginViewModel!
//    private var cancellables = Set<AnyCancellable>()
//    private var loadingView: LoadingView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.delegate = self
//
//        self.title = L10n.login
//    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Create Tab one
//        let tabOne = self.loginViewModel.coordinator?.registrationScene()
//        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
//
//        tabOne?.tabBarItem = tabOneBarItem
//
//
//        // Create Tab two
//        let tabTwo = self.loginViewModel.coordinator?.trasncplationScene()
//        let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
//
//        tabTwo?.tabBarItem = tabTwoBarItem2
//
//        self.viewControllers = [tabOne!, tabTwo!]
//    }

    // UITabBarControllerDelegate method
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
////        print("Selected \(viewController.title!)")
//    }
//
//}
