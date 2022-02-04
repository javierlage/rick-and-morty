//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Javier Lage on 4/2/22.
//

import Foundation
import Kingfisher
import UIKit

class CharacterDetailViewController: UIViewController {
    // MARK: - Class properties

    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var specieLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var originLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!

    var presenter: CharacterDetailViewToPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize UI
        initUI()
    }

    // MARK: - Common functions

    private func initUI() {
        if let character = presenter?.character {
            characterImageView.kf.setImage(with: URL(string: character.image), placeholder: UIImage(named: "Default"))

            characterNameLabel.text = character.name
            specieLabel.text = character.species
            genderLabel.text = character.gender
            statusLabel.text = character.status
            locationLabel.text = character.location.name
            originLabel.text = character.origin.name
        }
    }
}

// MARK: - CharacterDetailPresenterToView

extension CharacterDetailViewController: CharacterDetailPresenterToView {}
