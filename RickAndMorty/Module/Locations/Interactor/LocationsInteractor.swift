//
//  LocationsInteractor.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class LocationsInteractor: LocationListServiceDelegate {
    // MARK: - Class properties

    weak var presenter: LocationsInteractorToPresenter?
    
    // MARK: - Locations List rest delegates
    
    func onLocationListPreExecute() {
        // TODO: Implement stub!
    }
    
    func onLocationListResponse(response: LocationListResponse) {
        presenter?.onLocationListResponse(nextPage: response.info.next, locations: response.results)
    }
    
    func onLocationListFailure(error: ServiceError) {
        // TODO: Implement stub!
    }
}
// MARK: - LocationsPresenterToInteractor

extension LocationsInteractor: LocationsPresenterToInteractor {
    func findLocations(nextPage: Int) {
        let request = PagingListRequest(page: nextPage)
        LocationRepository.getLocationList(request: request, listener: self)
    }
}
