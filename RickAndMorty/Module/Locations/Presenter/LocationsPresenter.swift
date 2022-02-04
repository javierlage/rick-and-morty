//
//  LocationsPresenter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class LocationsPresenter {
    // MARK: - Class properties

    weak var view: LocationsPresenterToView?
    var interactor: LocationsPresenterToInteractor?
    var router: LocationsPresenterToRouter?
    
    private var locationList = [Location]()
    private var page = 0
    private var hasNextPage = true
}


// MARK: - LocationsViewToPresenter

extension LocationsPresenter: LocationsViewToPresenter {
    func findLocations() {
        if hasNextPage {
            interactor?.findLocations(nextPage: page)
        } else {
            view?.finishLoadingMore()
        }
    }
    
    func getLocationsCount() -> Int {
        return locationList.count
    }
    
    func getLocationAt(index: Int) -> Location {
        return locationList[index]
    }
    
    func onLocationItemClicked(_ item: Location) {
        router?.navigateToLocationDetail(item)
    }
}

// MARK: - LocationsInteractorToPresenter

extension LocationsPresenter: LocationsInteractorToPresenter {
    func onLocationListResponse(nextPage: String?, locations: [Location]) {
        if nextPage != nil {
            page += 1
        } else {
            hasNextPage = false
        }
        
        var indexPaths = [IndexPath]()
        var indexPathRow = locationList.count
        for content in locations {
            locationList.append(content)
            indexPaths.append(IndexPath(row: indexPathRow, section: 0))
            indexPathRow += 1
        }
        view?.onLocationsLoaded(indexPaths: indexPaths)
    }
}
