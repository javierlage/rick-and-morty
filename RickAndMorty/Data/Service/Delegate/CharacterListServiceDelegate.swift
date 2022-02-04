//
//  CharacterListServiceDelegate.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

protocol CharacterListServiceDelegate {
    func onCharacterListPreExecute()
    func onCharacterListResponse(response: CharacterListResponse)
    func onCharacterListFailure(error: ServiceError)
}
