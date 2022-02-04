//
//  CharacterListResponse.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class CharacterListResponse: Decodable {
    var info: PagingInfo
    var results: [Character]
}
