//
//  Extension+UIViewController.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 09/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation
import UIKit
import Combine

extension UIViewController {
    
    func showMessage(message: String){
        CommonFunction.shared.showFloatingAlert(message: message, style: .warning, position: .bottom)
    }
    
    func initLoadingView(subView: UIView) -> UIActivityIndicatorView {
        
        var viewLoading: UIActivityIndicatorView!
        
        if #available(iOS 13.0, *) {
            viewLoading = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
            viewLoading = UIActivityIndicatorView(style: .gray)
        }
        
        viewLoading.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: subView.bounds.width, height: CGFloat(70))
        viewLoading.center = view.center
        viewLoading.hidesWhenStopped = true
        subView.addSubview(viewLoading)
        subView.bringSubviewToFront(viewLoading)
        
        return viewLoading
        
    }
    
    func initLoadingViewBg(subView: UIView) -> UIView {
        
        var boxView = UIView()
        var viewLoading: UIActivityIndicatorView!

        if #available(iOS 13.0, *) {
            viewLoading = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
            viewLoading = UIActivityIndicatorView(style: .white)
        }
        
        // You only need to adjust this frame to move it anywhere you want
        boxView = UIView(frame: CGRect(x: subView.frame.midX - 90, y: subView.frame.midY - 25, width: 180, height: 50))
        boxView.backgroundColor = UIColor.gray
        boxView.alpha = 0.8
//        boxView.layer.cornerRadius = 10
        
        viewLoading.frame = CGRect(x: CGFloat(0), y: subView.bounds.height/2, width: subView.bounds.width, height: CGFloat(70))
        viewLoading.center = view.center
        viewLoading.hidesWhenStopped = true
        viewLoading.startAnimating()

        boxView.addSubview(viewLoading)
        
        subView.addSubview(boxView)
        subView.bringSubviewToFront(boxView)
        
        return boxView
        
    }
    
    func showAlertWithCompletion(_ title: String, message msg: String, completion: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: L10n.no, style: .default, handler: { action in
            completion(false)
        })
        
        let okButton = UIAlertAction(title: L10n.yes, style: .default, handler: { action in
            completion(true)
        })
        
        alert.addAction(cancelButton)
        alert.addAction(okButton)

        self.present(alert, animated: true, completion: nil)
        
    }
    
}

//class RegistrationFlowViewController: UIViewController, RegistrationFlowProtocol {
//    func onValidateData(completion: @escaping (Bool) -> Void){
//        return completion(false)
//    }
//
//    var cancellables = Set<AnyCancellable>()
//    var registrationViewModel: RegistrationViewModel!
//
//    internal init(viewModel: RegistrationViewModel) {
//        self.registrationViewModel = viewModel
//        super.init(nibName: String(describing: type(of: self)), bundle: .main)
//    }
//
//    @available(*, unavailable)
//    required init?(coder aDecoder: NSCoder) {
//        fatalError()
//    }
//}


class LoadingView {

    let uiView          :   UIView
    let message         :   String
    let messageLabel    =   UILabel()

    let loadingSV       =   UIStackView()
    let loadingView     =   UIView()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)

    init(uiView: UIView, message: String) {
        self.uiView     =   uiView
        self.message    =   message
        self.setup()
    }

    func setup(){
        let viewWidth   = uiView.bounds.width
        let viewHeight  = uiView.bounds.height

        // Configuring the message label
        messageLabel.text             = message
        messageLabel.textColor        = UIColor.darkGray
        messageLabel.textAlignment    = .center
        messageLabel.numberOfLines    = 3
        messageLabel.lineBreakMode    = .byWordWrapping

        // Creating stackView to center and align Label and Activity Indicator
        loadingSV.axis          = .vertical
        loadingSV.distribution  = .equalSpacing
        loadingSV.alignment     = .center
        loadingSV.addArrangedSubview(activityIndicator)
        loadingSV.addArrangedSubview(messageLabel)

        // Creating loadingView, this acts as a background for label and activityIndicator
        loadingView.frame           = uiView.frame
        loadingView.center          = uiView.center
        loadingView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        loadingView.clipsToBounds   = true

        // Disabling auto constraints
        loadingSV.translatesAutoresizingMaskIntoConstraints = false

        // Adding subviews
        loadingView.addSubview(loadingSV)
        uiView.addSubview(loadingView)
        activityIndicator.startAnimating()

        // Views dictionary
        let views = [
            "loadingSV": loadingSV
        ]

        uiView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(viewWidth / 2)-[loadingSV(0)]-|", options: [], metrics: nil, views: views))
        uiView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(viewHeight / 2)-[loadingSV(0)]-|", options: [], metrics: nil, views: views))
    }

    // Call this method to hide loadingView
    func show() {
        loadingView.isHidden = false
    }

    // Call this method to show loadingView
    func hide(){
        loadingView.isHidden = true
    }

    // Call this method to check if loading view already exists
    func isHidden() -> Bool{
        if loadingView.isHidden == false{
            return false
        }
        else{
            return true
        }
    }
}
