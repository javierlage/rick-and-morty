//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation
import UIKit
import UIScrollView_InfiniteScroll

class CharactersViewController: UIViewController {
    // MARK: - Class properties

    @IBOutlet var charactersTableView: UITableView!
    var presenter: CharactersViewToPresenter?

    private var isLoadingMore = false

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize UI
        initUI()
        presenter?.findCharacters()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = "Characters"
    }

    // MARK: - Common functions

    private func initUI() {
        charactersTableView.delegate = self
        charactersTableView.dataSource = self

        charactersTableView.addInfiniteScroll { (_) -> Void in
            // Update table view
            self.isLoadingMore = true
            // Call a ws to get teams
            self.presenter?.findCharacters()
        }
    }
}

// MARK: - UI Delegates

extension CharactersViewController: CharacterItemDelegate {
    func onCharacterItemClicked(_ item: Character) {
        presenter?.onCharacterItemClicked(item)
    }
}

// MARK: - TableView Delegates

extension CharactersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCharactersCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter?.getCharacterAt(index: indexPath.row)
        let cell = Bundle.main.loadNibNamed("CharacterItemTableViewCell", owner: self, options: nil)?.first as! CharacterItemTableViewCell
        cell.bind(item: item!, itemDelegate: self)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - CharactersPresenterToView

extension CharactersViewController: CharactersPresenterToView {
    func onCharactersLoaded(indexPaths: [IndexPath]) {
        if isLoadingMore {
            charactersTableView.beginUpdates()
            charactersTableView.insertRows(at: indexPaths, with: .automatic)
            charactersTableView.endUpdates()
            charactersTableView.finishInfiniteScroll()
            isLoadingMore = false
        } else {
            charactersTableView.reloadData()
        }
    }

    func finishLoadingMore() {
        charactersTableView.finishInfiniteScroll()
    }
}
