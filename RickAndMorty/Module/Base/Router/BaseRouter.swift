//
//  BaseRouter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import UIKit

class BaseRouter {
    static var navigationController: UINavigationController? {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        if let navigationController = window?.rootViewController as? UINavigationController {
            return navigationController
        }
        return nil
    }
}
