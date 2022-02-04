//
//  CharactersRouter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import UIKit

class CharactersRouter: BaseRouter {
    // MARK: - Common functions

    class func initModule(view: CharactersViewController) {
        let presenter: CharactersViewToPresenter & CharactersInteractorToPresenter = CharactersPresenter()
        let interactor: CharactersPresenterToInteractor = CharactersInteractor()
        let router: CharactersPresenterToRouter = CharactersRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        interactor.presenter = presenter
    }
}

// MARK: - CharactersPresenterToRouter

extension CharactersRouter: CharactersPresenterToRouter {
    func navigateToCharacterDetail(_ withItem: Character) {
        let characterDetailModule = CharacterDetailRouter.createModule(with: withItem)
        CharactersRouter.navigationController?.pushViewController(characterDetailModule, animated: true)
    }
}
