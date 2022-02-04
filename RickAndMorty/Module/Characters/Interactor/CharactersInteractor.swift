//
//  CharactersInteractor.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation

class CharactersInteractor: CharacterListServiceDelegate {
    
    // MARK: - Class properties

    weak var presenter: CharactersInteractorToPresenter?
    
    // MARK: - Characters List rest delegates
    
    func onCharacterListPreExecute() {
        // TODO: Implement stub!
    }
    
    func onCharacterListResponse(response: CharacterListResponse) {
        presenter?.onCharacterListResponse(nextPage: response.info.next, characters: response.results)
    }
    
    func onCharacterListFailure(error: ServiceError) {
        // TODO: Implement stub!
    }
}

// MARK: - CharactersPresenterToInteractor

extension CharactersInteractor: CharactersPresenterToInteractor {
    func findCharacters(nextPage: Int) {
        let request = PagingListRequest(page: nextPage)
        CharacterRepository.getCharacterList(request: request, listener: self)
    }
}
