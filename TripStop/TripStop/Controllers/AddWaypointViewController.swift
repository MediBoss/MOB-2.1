//
//  AddWaypointViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import MapKit
import UIKit

class AddWaypointViewController: UIViewController {

    let locationSearchTable = SearchResultTableViewController()
    var waypointSearchController: UISearchController? = nil
    lazy var mapView = MKMapView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpSeachController()
        setUpNavigationBarItems()
        view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
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
        
        waypointSearchController = UISearchController(searchResultsController: locationSearchTable)
        waypointSearchController?.searchResultsUpdater = locationSearchTable
        waypointSearchController?.obscuresBackgroundDuringPresentation = false
        waypointSearchController?.searchBar.placeholder = "Search Waypoint"
        waypointSearchController?.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = waypointSearchController
        definesPresentationContext = true
    }
    
    @objc private func saveWaypointButtonTapped(_ sender: UIBarButtonItem) {
        print("save button tapped")
    }
    
    @objc private func cancelButtonIsTapped(_ sender: UIBarButtonItem) {
    
        navigationController?.popViewController(animated: true)
    }
}


