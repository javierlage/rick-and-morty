//
//  CharactersPresenterTests.swift
//  RickAndMortyTests
//
//  Created by Javier Lage on 4/2/22.
//

@testable import RickAndMorty
import XCTest

class CharactersPresenterTests: XCTestCase {
    var charactersPresenter: CharactersPresenter!
    
    override func setUp() {
        super.setUp()
        charactersPresenter = CharactersPresenter()
    }
    
    func testPresenterInitialListIsEmpty() {
        XCTAssertTrue(charactersPresenter.getCharactersCount() == 0)
    }
}

