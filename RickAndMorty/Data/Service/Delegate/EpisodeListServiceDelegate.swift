//
//  EpisodeListServiceDelegate.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

protocol EpisodeListServiceDelegate {
    func onEpisodeListPreExecute()
    func onEpisodeListResponse(response: EpisodeListResponse)
    func onEpisodeListFailure(error: ServiceError)
}
