//
//  EpisodeListResponse.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class EpisodeListResponse: Decodable {
    var info: PagingInfo
    var results: [Episode]
}
