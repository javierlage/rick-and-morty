//
//  EpisodeRepository.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import Foundation

class EpisodeRepository {
    static func getEpisodeList(request: PagingListRequest, listener: EpisodeListServiceDelegate) {
        EpisodeService.getEpisodeList(request: request, listener: listener)
    }
}
