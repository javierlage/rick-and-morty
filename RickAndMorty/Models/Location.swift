//
//  Location.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class Location: Decodable {
    var name: String
    var type: String?
    var dimension: String?
    var residents: [String]?

    init(name: String, type: String, dimension: String) {
        self.name = name
        self.type = type
        self.dimension = dimension
    }
}
