//
//  LocationService.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import Foundation

class LocationService {
    private static let locationsUrl = "/api/location/"

    static func getLocationList(request: PagingListRequest, listener: LocationListServiceDelegate) {
        listener.onLocationListPreExecute()
        let url = Url.base.rawValue + locationsUrl
        let encodedData = request.dictionary
        RequestHelper.requestExecute(url, parameters: encodedData, method: .get, success: { response in
            // Evaluate status code for manage response.
            switch response.response?.statusCode {
            case HTTPStatusCode.ok.rawValue:
                do {
                    let result = try JSONDecoder().decode(LocationListResponse.self, from: response.data!)
                    listener.onLocationListResponse(response: result)
                } catch let error {
                    listener.onLocationListFailure(error: DecodeServiceError(message: error.localizedDescription))
                }
            case .some(_), .none:
                listener.onLocationListFailure(error: ServiceError())
            }

        }, failure: { error in
            listener.onLocationListFailure(error: ServiceError(message: error.debugDescription))
        })
    }
}
