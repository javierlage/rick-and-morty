//
//  Character.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation
import MapKit

class Character: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]?

    // TODO: This constructor is only for test purpose
    init() {
        id = 0
        name = ""
        status = ""
        species = ""
        type = ""
        gender = ""
        origin = Origin(name: "", url: "")
        location = Location(name: "", type: "", dimension: "")
        image = ""
    }
}
