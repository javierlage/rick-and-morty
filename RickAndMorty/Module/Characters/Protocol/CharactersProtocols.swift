//
//  CharactersProtocols.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

// MARK: - Presenter

protocol CharactersViewToPresenter: AnyObject {
    var view: CharactersPresenterToView? { get set }
    var interactor: CharactersPresenterToInteractor? { get set }
    var router: CharactersPresenterToRouter? { get set }

    func findCharacters()
    func getCharactersCount() -> Int
    func getCharacterAt(index: Int) -> Character
    func onCharacterItemClicked(_ item: Character)
}

protocol CharactersPresenterToView: AnyObject {
    func onCharactersLoaded(indexPaths: [IndexPath])
    func finishLoadingMore()
}

// MARK: - Interactor

protocol CharactersPresenterToInteractor: AnyObject {
    var presenter: CharactersInteractorToPresenter? { get set }

    func findCharacters(nextPage: Int)
}

protocol CharactersInteractorToPresenter: AnyObject {
    func onCharacterListResponse(nextPage: String?, characters: [Character])
}

// MARK: - Router

protocol CharactersPresenterToRouter: AnyObject {
    func navigateToCharacterDetail(_ withItem: Character)
}

// MARK: - UI Delegates

protocol CharacterItemDelegate {
    func onCharacterItemClicked(_ item: Character)
}
