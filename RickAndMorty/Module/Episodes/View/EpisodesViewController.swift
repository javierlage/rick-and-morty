//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation
import UIKit
import UIScrollView_InfiniteScroll

class EpisodesViewController: UIViewController {
    // MARK: - Class properties

    @IBOutlet var episodesTableView: UITableView!
    var presenter: EpisodesViewToPresenter?

    private var isLoadingMore = false

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize UI
        initUI()
        presenter?.findEpisodes()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = "Episodes"
    }

    // MARK: - Common functions

    private func initUI() {
        episodesTableView.delegate = self
        episodesTableView.dataSource = self

        episodesTableView.addInfiniteScroll { (_) -> Void in
            // Update table view
            self.isLoadingMore = true
            // Call a ws to get teams
            self.presenter?.findEpisodes()
        }
    }
}

// MARK: - UI Delegates

extension EpisodesViewController: EpisodeItemDelegate {
    func onEpisodeItemClicked(_ item: Episode) {
        presenter?.onEpisodeItemClicked(item)
    }
}

// MARK: - TableView Delegates

extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getEpisodesCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter?.getEpisodeAt(index: indexPath.row)
        let cell = Bundle.main.loadNibNamed("EpisodeItemTableViewCell", owner: self, options: nil)?.first as! EpisodeItemTableViewCell
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

// MARK: - EpisodesPresenterToView

extension EpisodesViewController: EpisodesPresenterToView {
    func onEpisodesLoaded(indexPaths: [IndexPath]) {
        if isLoadingMore {
            episodesTableView.beginUpdates()
            episodesTableView.insertRows(at: indexPaths, with: .automatic)
            episodesTableView.endUpdates()
            episodesTableView.finishInfiniteScroll()
            isLoadingMore = false
        } else {
            episodesTableView.reloadData()
        }
    }

    func finishLoadingMore() {
        episodesTableView.finishInfiniteScroll()
    }
}
