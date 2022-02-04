//
//  LocationsProtocols.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

// MARK: - Presenter

protocol LocationsViewToPresenter: AnyObject {
    var view: LocationsPresenterToView? { get set }
    var interactor: LocationsPresenterToInteractor? { get set }
    var router: LocationsPresenterToRouter? { get set }
    
    func findLocations()
    func getLocationsCount() -> Int
    func getLocationAt(index: Int) -> Location
    func onLocationItemClicked(_ item: Location)
}

protocol LocationsPresenterToView: AnyObject {
    func onLocationsLoaded(indexPaths: [IndexPath])
    func finishLoadingMore()
}

// MARK: - Interactor

protocol LocationsPresenterToInteractor: AnyObject {
    var presenter: LocationsInteractorToPresenter? { get set }
    func findLocations(nextPage: Int)
}

protocol LocationsInteractorToPresenter: AnyObject {
    func onLocationListResponse(nextPage: String?, locations: [Location])
}

// MARK: - Router

protocol LocationsPresenterToRouter: AnyObject {
    func navigateToLocationDetail(_ withItem: Location)
}

// MARK: - UI Delegates

protocol LocationItemDelegate {
    func onLocationItemClicked(_ item: Location)
}
