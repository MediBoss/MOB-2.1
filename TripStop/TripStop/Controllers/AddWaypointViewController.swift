//
//  AddWaypointViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class AddWaypointViewController: UIViewController {

    
    lazy var waypointSearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpSeachController()
        setUpNavigationBarItems()
    }
    
    // - MARK: Private instance methods
    private func setUpNavigationBarItems(){
        
        navigationItem.title = "Add Waypoint"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveWaypointButtonTapped(_:)))
        navigationItem.leftBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonIsTapped(_:)))
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.alpha = 1
    }
    
    private func setUpSeachController() {
        
        waypointSearchController.searchResultsUpdater = self
        waypointSearchController.obscuresBackgroundDuringPresentation = false
        waypointSearchController.searchBar.placeholder = "Search Waypoint"
        navigationItem.searchController = waypointSearchController
        definesPresentationContext = true
    }
    
    @objc private func saveWaypointButtonTapped(_ sender: UIBarButtonItem) {
        print("save button tapped")
    }
    
    @objc private func cancelButtonIsTapped(_ sender: UIBarButtonItem) {
        print("cancel button is tapped")
    }
}

extension AddWaypointViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        // TODO - Updated search based on Google Place API
    }
}
