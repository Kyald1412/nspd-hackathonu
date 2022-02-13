//
//  UIViewController+Extension.swift
//  Asa
//
//  Created by Jehnsen Hirena Kane on 13/02/22.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Close", style: .destructive, handler: nil)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
}

