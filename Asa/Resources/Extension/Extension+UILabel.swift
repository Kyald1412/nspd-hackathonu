//
//  Extension+UILablel.swift
//  Asa
//
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    @IBInspectable var localized_title: String? {
           get { return nil }
           set(key) {
            
            self.text = L10n.localize(string: key!)
           }
      }
}
  
