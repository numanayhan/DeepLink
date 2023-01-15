//
//  Navigation.swift
//  DeepLink
//
//  Created by na on 15.01.2023.
//

import Foundation
import UIKit

class Navigation {
    private let window : UIWindow?
    init(window: UIWindow ) {
        self.window = window
    }
    func startApp() {
        window!.rootViewController = UINavigationController(rootViewController: Launch())
        window!.makeKeyAndVisible()
    }

}
