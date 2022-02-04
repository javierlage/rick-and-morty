//
//  MainTabBarController.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: Move this logic outside here!!!
        viewControllers?.forEach {
            if let charactersViewController = $0 as? CharactersViewController {
                CharactersRouter.initModule(view: charactersViewController)
            }
            if let episodesViewController = $0 as? EpisodesViewController {
                EpisodesRouter.initModule(view: episodesViewController)
            }
            if let locationsViewController = $0 as? LocationsViewController {
                LocationsRouter.initModule(view: locationsViewController)
            }
        }
    }
}
