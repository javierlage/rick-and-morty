//
//  CharactersRouterTests.swift
//  RickAndMortyTests
//
//  Created by Javier Lage on 4/2/22.
//

@testable import RickAndMorty
import XCTest

class CharactersRouterTests: XCTestCase {
    var charactersRouter: CharactersRouter!

    override func setUp() {
        super.setUp()
        charactersRouter = CharactersRouter()
    }

    func testTopVCIsCharacterDetailVCWhenPresented() {
        let character = Character()
        charactersRouter.navigateToCharacterDetail(character)
        XCTAssertTrue(CharactersRouter.navigationController?.viewControllers.last is CharacterDetailViewController)
    }
    
    func testVCPresenterIsNotNil() {
        let vc = CharactersViewController()
        CharactersRouter.initModule(view: vc)
        XCTAssertNotNil(vc.presenter)
    }
}
