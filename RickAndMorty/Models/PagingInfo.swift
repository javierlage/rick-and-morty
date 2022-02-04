//
//  PagingInfo.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class PagingInfo: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
