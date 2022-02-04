//
//  CharacterDetailInteractor.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import Foundation

class CharacterDetailInteractor {
    // MARK: - Class properties

    weak var presenter: CharacterDetailInteractorToPresenter?
}

// MARK: - CharacterDetailPresenterToInteractor

extension CharacterDetailInteractor: CharacterDetailPresenterToInteractor {}
