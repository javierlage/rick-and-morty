//
//  CharactersPresenter.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class CharactersPresenter {
    // MARK: - Class properties

    weak var view: CharactersPresenterToView?
    var interactor: CharactersPresenterToInteractor?
    var router: CharactersPresenterToRouter?

    private var characterList = [Character]()
    private var page = 0
    private var hasNextPage = true
}

// MARK: - CharactersViewToPresenter

extension CharactersPresenter: CharactersViewToPresenter {
    func findCharacters() {
        if hasNextPage {
            interactor?.findCharacters(nextPage: page)
        } else {
            view?.finishLoadingMore()
        }
    }
    
    func getCharactersCount() -> Int {
        return characterList.count
    }
    
    func getCharacterAt(index: Int) -> Character {
        return characterList[index]
    }
    
    func onCharacterItemClicked(_ item: Character) {
        router?.navigateToCharacterDetail(item)
    }
}

// MARK: - CharactersInteractorToPresenter

extension CharactersPresenter: CharactersInteractorToPresenter {
    func onCharacterListResponse(nextPage: String?, characters: [Character]) {
        if nextPage != nil {
            page += 1
        } else {
            hasNextPage = false
        }
        
        var indexPaths = [IndexPath]()
        var indexPathRow = characterList.count
        for content in characters {
            characterList.append(content)
            indexPaths.append(IndexPath(row: indexPathRow, section: 0))
            indexPathRow += 1
        }
        view?.onCharactersLoaded(indexPaths: indexPaths)
    }
}
