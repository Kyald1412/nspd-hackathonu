//
//  StoryboardLoadable.swift
//  Asa
//
//  Created by Dhiky Aldwiansyah on 24/08/20.
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation

import UIKit

protocol StoryboardLoadable: AnyObject {
    static var storyboardName: String { get }
}

protocol SceneStoryboardLoadable: StoryboardLoadable {}

extension SceneStoryboardLoadable where Self: UIViewController {
    static var storyboardName: String {
        var storyboardName = String(describing: Self.self)
        
        let replacements = [
            ("ViewController", ""),
            ("Scene", ""),
            ("NavigationController", "")
        ]
        
        for (searchString, replacement) in replacements {
            storyboardName = storyboardName.replacingOccurrences(of: searchString, with: replacement)
        }

        return storyboardName
    }
}
