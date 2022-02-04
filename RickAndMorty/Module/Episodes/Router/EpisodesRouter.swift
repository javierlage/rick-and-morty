//
//  EpisodesRouter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class EpisodesRouter: BaseRouter {
    // MARK: - Common functions

    class func initModule(view: EpisodesViewController) {
        let presenter: EpisodesViewToPresenter & EpisodesInteractorToPresenter = EpisodesPresenter()
        let interactor: EpisodesPresenterToInteractor = EpisodesInteractor()
        let router: EpisodesPresenterToRouter = EpisodesRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        interactor.presenter = presenter
    }
}

// MARK: - EpisodesPresenterToRouter

extension EpisodesRouter: EpisodesPresenterToRouter {
    func navigateToEpisodeDetail(_ withItem: Episode) {
        // TODO: Implement stub!
    }
}
