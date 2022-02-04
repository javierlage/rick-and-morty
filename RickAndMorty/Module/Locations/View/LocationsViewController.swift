//
//  LocationsViewController.swift
//  RickAndMorty
//
//  Created by Javier Lage on 3/2/22.
//

import Foundation
import UIKit
import UIScrollView_InfiniteScroll

class LocationsViewController: UIViewController {
    // MARK: - Class properties

    @IBOutlet var locationsTableView: UITableView!
    var presenter: LocationsViewToPresenter?
    
    private var isLoadingMore = false

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize UI
        initUI()
        presenter?.findLocations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = "Locations"
    }

    // MARK: - Common functions

    private func initUI() {
        locationsTableView.delegate = self
        locationsTableView.dataSource = self

        locationsTableView.addInfiniteScroll { (_) -> Void in
            // Update table view
            self.isLoadingMore = true
            // Call a ws to get teams
            self.presenter?.findLocations()
        }
    }
}

// MARK: - UI Delegates

extension LocationsViewController: LocationItemDelegate {
    func onLocationItemClicked(_ item: Location) {
        presenter?.onLocationItemClicked(item)
    }
}

// MARK: - TableView Delegates

extension LocationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getLocationsCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter?.getLocationAt(index: indexPath.row)
        let cell = Bundle.main.loadNibNamed("LocationItemTableViewCell", owner: self, options: nil)?.first as! LocationItemTableViewCell
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

// MARK: - LocationsPresenterToView

extension LocationsViewController: LocationsPresenterToView {
    
    func onLocationsLoaded(indexPaths: [IndexPath]) {
        if isLoadingMore {
            locationsTableView.beginUpdates()
            locationsTableView.insertRows(at: indexPaths, with: .automatic)
            locationsTableView.endUpdates()
            locationsTableView.finishInfiniteScroll()
            isLoadingMore = false
        } else {
            locationsTableView.reloadData()
        }
    }

    func finishLoadingMore() {
        locationsTableView.finishInfiniteScroll()
    }
}
