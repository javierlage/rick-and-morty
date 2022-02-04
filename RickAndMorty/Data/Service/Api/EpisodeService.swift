//
//  EpisodeService.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import Foundation

class EpisodeService {
    private static let episodesUrl = "/api/episode/"

    static func getEpisodeList(request: PagingListRequest, listener: EpisodeListServiceDelegate) {
        listener.onEpisodeListPreExecute()
        let url = Url.base.rawValue + episodesUrl
        let encodedData = request.dictionary
        RequestHelper.requestExecute(url, parameters: encodedData, method: .get, success: { response in
            // Evaluate status code for manage response.
            switch response.response?.statusCode {
            case HTTPStatusCode.ok.rawValue:
                do {
                    let result = try JSONDecoder().decode(EpisodeListResponse.self, from: response.data!)
                    listener.onEpisodeListResponse(response: result)
                } catch let error {
                    listener.onEpisodeListFailure(error: DecodeServiceError(message: error.localizedDescription))
                }
            case .some(_), .none:
                listener.onEpisodeListFailure(error: ServiceError())
            }

        }, failure: { error in
            listener.onEpisodeListFailure(error: ServiceError(message: error.debugDescription))
        })
    }
}
