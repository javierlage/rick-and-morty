//
//  EpisodesPresenter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class EpisodesPresenter {
    // MARK: - Class properties

    weak var view: EpisodesPresenterToView?
    var interactor: EpisodesPresenterToInteractor?
    var router: EpisodesPresenterToRouter?
    
    private var episodeList = [Episode]()
    private var page = 0
    private var hasNextPage = true
}


// MARK: - EpisodesViewToPresenter

extension EpisodesPresenter: EpisodesViewToPresenter {
    func findEpisodes() {
        if hasNextPage {
            interactor?.findEpisodes(nextPage: page)
        } else {
            view?.finishLoadingMore()
        }
    }
    
    func getEpisodesCount() -> Int {
        return episodeList.count
    }
    
    func getEpisodeAt(index: Int) -> Episode {
        return episodeList[index]
    }
    
    func onEpisodeItemClicked(_ item: Episode) {
        router?.navigateToEpisodeDetail(item)
    }
}

// MARK: - EpisodesInteractorToPresenter

extension EpisodesPresenter: EpisodesInteractorToPresenter {
    func onEpisodeListResponse(nextPage: String?, episodes: [Episode]) {
        if nextPage != nil {
            page += 1
        } else {
            hasNextPage = false
        }
        
        var indexPaths = [IndexPath]()
        var indexPathRow = episodeList.count
        for content in episodes {
            episodeList.append(content)
            indexPaths.append(IndexPath(row: indexPathRow, section: 0))
            indexPathRow += 1
        }
        view?.onEpisodesLoaded(indexPaths: indexPaths)
    }
}
