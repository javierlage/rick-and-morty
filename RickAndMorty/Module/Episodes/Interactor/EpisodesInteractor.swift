//
//  EpisodesInteractor.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation
class EpisodesInteractor: EpisodeListServiceDelegate {
    // MARK: - Class properties

    weak var presenter: EpisodesInteractorToPresenter?
    
    // MARK: - Episodes List rest delegates
    
    func onEpisodeListPreExecute() {
        // TODO: Implement stub!
    }
    
    func onEpisodeListResponse(response: EpisodeListResponse) {
        presenter?.onEpisodeListResponse(nextPage: response.info.next, episodes: response.results)
    }
    
    func onEpisodeListFailure(error: ServiceError) {
        // TODO: Implement stub!
    }
}

// MARK: - EpisodesPresenterToInteractor

extension EpisodesInteractor: EpisodesPresenterToInteractor {
    func findEpisodes(nextPage: Int) {
        let request = PagingListRequest(page: nextPage)
        EpisodeRepository.getEpisodeList(request: request, listener: self)
    }
}
