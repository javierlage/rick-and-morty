//
//  LocationListServiceDelegate.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

protocol LocationListServiceDelegate {
    func onLocationListPreExecute()
    func onLocationListResponse(response: LocationListResponse)
    func onLocationListFailure(error: ServiceError)
}
