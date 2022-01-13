//
//  Coordinator.swift
//  Asa
//
//  Copyright © 2020 Dhiky Aldwiansyah. All rights reserved.
//

import Foundation

public protocol Coordinator: AnyObject {
    func start()
}

public protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}
