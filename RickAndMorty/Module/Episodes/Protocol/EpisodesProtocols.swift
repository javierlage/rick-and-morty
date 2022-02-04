//
//  EpisodesProtocols.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

// MARK: - Presenter

protocol EpisodesViewToPresenter: AnyObject {
    var view: EpisodesPresenterToView? { get set }
    var interactor: EpisodesPresenterToInteractor? { get set }
    var router: EpisodesPresenterToRouter? { get set }
    
    func findEpisodes()
    func getEpisodesCount() -> Int
    func getEpisodeAt(index: Int) -> Episode
    func onEpisodeItemClicked(_ item: Episode)
}

protocol EpisodesPresenterToView: AnyObject {
    func onEpisodesLoaded(indexPaths: [IndexPath])
    func finishLoadingMore()
}

// MARK: - Interactor

protocol EpisodesPresenterToInteractor: AnyObject {
    var presenter: EpisodesInteractorToPresenter? { get set }
    
    func findEpisodes(nextPage: Int)
}

protocol EpisodesInteractorToPresenter: AnyObject {
    func onEpisodeListResponse(nextPage: String?, episodes: [Episode])
}

// MARK: - Router

protocol EpisodesPresenterToRouter: AnyObject {
    func navigateToEpisodeDetail(_ withItem: Episode)
}

// MARK: - UI Delegates

protocol EpisodeItemDelegate {
    func onEpisodeItemClicked(_ item: Episode)
}
