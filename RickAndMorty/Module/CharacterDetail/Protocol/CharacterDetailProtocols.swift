//
//  CharacterDetailProtocols.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import Foundation

// MARK: - Presenter

protocol CharacterDetailViewToPresenter: AnyObject {
    var view: CharacterDetailPresenterToView? { get set }
    var interactor: CharacterDetailPresenterToInteractor? { get set }
    var router: CharacterDetailPresenterToRouter? { get set }
    
    var character: Character! { get set }
}

protocol CharacterDetailPresenterToView: AnyObject {
}

// MARK: - Interactor

protocol CharacterDetailPresenterToInteractor: AnyObject {
    var presenter: CharacterDetailInteractorToPresenter? { get set }
}

protocol CharacterDetailInteractorToPresenter: AnyObject {
}

// MARK: - Router

protocol CharacterDetailPresenterToRouter: AnyObject {
}
