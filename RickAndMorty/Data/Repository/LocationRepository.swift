//
//  LocationRepository.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import Foundation

class LocationRepository {
    static func getLocationList(request: PagingListRequest, listener: LocationListServiceDelegate) {
        LocationService.getLocationList(request: request, listener: listener)
    }
}
