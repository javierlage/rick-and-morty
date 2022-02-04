//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class CharacterService {
    private static let charactersUrl = "/api/character/"

    static func getCharacterList(request: PagingListRequest, listener: CharacterListServiceDelegate) {
        listener.onCharacterListPreExecute()
        let url = Url.base.rawValue + charactersUrl
        let encodedData = request.dictionary
        RequestHelper.requestExecute(url, parameters: encodedData, method: .get, success: { response in
            // Evaluate status code for manage response.
            switch response.response?.statusCode {
            case HTTPStatusCode.ok.rawValue:
                do {
                    let result = try JSONDecoder().decode(CharacterListResponse.self, from: response.data!)
                    listener.onCharacterListResponse(response: result)
                } catch let error {
                    listener.onCharacterListFailure(error: DecodeServiceError(message: error.localizedDescription))
                }
            case .some(_), .none:
                listener.onCharacterListFailure(error: ServiceError())
            }

        }, failure: { error in
            listener.onCharacterListFailure(error: ServiceError(message: error.debugDescription))
        })
    }
}
