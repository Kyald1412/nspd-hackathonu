//
//  Extension+Cell.swift
//  Asa
//
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import UIKit

extension UIImage {
  public var hasContent: Bool {
    return cgImage != nil || ciImage != nil
  }
}
