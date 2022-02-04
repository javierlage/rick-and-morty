//
//  CharacterRepository.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class CharacterRepository {
    static func getCharacterList(request: PagingListRequest, listener: CharacterListServiceDelegate) {
        CharacterService.getCharacterList(request: request, listener: listener)
    }
}
