//
//  Extension+UITextfield.swift
//  Asa
//
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import UIKit

extension UITextField {

    @IBInspectable var localized_text: String? {
         get { return nil }
         set(key) {
          
            self.text = L10n.localize(string: key!)
         }
    }
    
    @IBInspectable var localized_placeholder: String? {
         get { return nil }
         set(key) {
          
          self.placeholder = L10n.localize(string: key!)
         }
    }
}
