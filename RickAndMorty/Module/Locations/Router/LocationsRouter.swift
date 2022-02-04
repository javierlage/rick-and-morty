//
//  LocationsRouter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import UIKit

class LocationsRouter: BaseRouter {
    // MARK: - Common functions

    class func initModule(view: LocationsViewController) {
        
        let presenter: LocationsViewToPresenter & LocationsInteractorToPresenter = LocationsPresenter()
        let interactor: LocationsPresenterToInteractor = LocationsInteractor()
        let router: LocationsPresenterToRouter = LocationsRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor

        interactor.presenter = presenter
    }
}

// MARK: - LocationsPresenterToRouter

extension LocationsRouter: LocationsPresenterToRouter {
    func navigateToLocationDetail(_ withItem: Location) {
        // TODO: Implement stub!
    }
    
}
