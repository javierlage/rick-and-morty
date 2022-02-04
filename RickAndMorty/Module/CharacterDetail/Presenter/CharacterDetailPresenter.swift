//
//  CharacterDetailPresenter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import Foundation

class CharacterDetailPresenter {
    // MARK: - Class properties

    weak var view: CharacterDetailPresenterToView?
    var interactor: CharacterDetailPresenterToInteractor?
    var router: CharacterDetailPresenterToRouter?
    
    var character: Character!
}

// MARK: - CharacterDetailViewToPresenter

extension CharacterDetailPresenter: CharacterDetailViewToPresenter {}

// MARK: - CharacterDetailInteractorToPresenter

extension CharacterDetailPresenter: CharacterDetailInteractorToPresenter {}
