//
//  CharacterDetailRouter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import UIKit

class CharacterDetailRouter {
    // MARK: - Common functions

    class func createModule(with character: Character) -> UIViewController {
        let storyboard = UIStoryboard(name: "CharacterDetail", bundle: Bundle.main)
        if let view = storyboard.instantiateViewController(withIdentifier: "CharacterDetailViewController") as? CharacterDetailViewController {
            let presenter: CharacterDetailViewToPresenter & CharacterDetailInteractorToPresenter = CharacterDetailPresenter()
            let interactor: CharacterDetailPresenterToInteractor = CharacterDetailInteractor()
            let router: CharacterDetailPresenterToRouter = CharacterDetailRouter()

            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            // Set custom params to presenter
            presenter.character = character

            return view
        }

        return UIViewController()
    }
}

// MARK: - CharacterDetailPresenterToRouterProtocol

extension CharacterDetailRouter: CharacterDetailPresenterToRouter {
}
