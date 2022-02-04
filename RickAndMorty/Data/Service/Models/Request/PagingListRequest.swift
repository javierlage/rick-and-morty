//
//  CharacterListRequest.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class PagingListRequest: Codable {
    var page: Int!
    
    init(page: Int) {
        self.page = page
    }
}
