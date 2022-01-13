//
//  UIColor+Extension.swift
//  Asa
//
//  Created by Asa Team.
//  swiftlint:disable all

import UIKit

// MARK: - Colors Asset

extension UIColor {

    static let accentColor = UIColor.color(named: "AccentColor")

    private static func color(named: String) -> UIColor {
        return UIColor(named: named)!
    }

}

