//
//  AddWaypointViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import CoreData
import MapKit
import UIKit

class AddWaypointViewController: UIViewController {

    let locationSearchTable = SearchResultTableViewController()
    var waypointSearchController: UISearchController? = nil
    lazy var mapView = MKMapView.init()
    var wayPoint: Waypoint?
    var parentTrip: Trip?
    var waypointDetails: (String, CLLocationCoordinate2D)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpSeachController()
        setUpNavigationBarItems()
        view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onDidReceiveWaypointFromSearchBar(_:)),
                                               name: .didReceivedWaypointObject,
                                               object: nil)
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
        locationSearchTable.mapView = mapView
        navigationItem.searchController = waypointSearchController
        definesPresentationContext = true
    }
    
    @objc private func onDidReceiveWaypointFromSearchBar(_ sender: Notification){

        if let receivedWaypointDetails = sender.object as? (String, CLLocationCoordinate2D) {
            self.waypointDetails = receivedWaypointDetails
        }
    }
    
    @objc private func saveWaypointButtonTapped(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
        let entityDescription = NSEntityDescription.entity(forEntityName: "Waypoint", in: CoreDataStack.shared.peristentContainer.viewContext)
        let context = CoreDataStack.shared.peristentContainer.viewContext
        if let entityDescription = entityDescription {
            var waypoint = NSManagedObject(entity: entityDescription, insertInto: context) as! Waypoint
            
            if let details = waypointDetails {
                
                let waypointName = details.0
                let longitude = details.1.longitude
                let latitude = details.1.latitude
                
                waypoint.name = waypointName
                waypoint.coordinates = CustomCoordinates(lon: longitude, lat: latitude)
                waypoint.trip = parentTrip!
                parentTrip?.addToWaypoint(waypoint)
                CoreDataStack.shared.save()
            }
        }
    }
    
    @objc private func cancelButtonIsTapped(_ sender: UIBarButtonItem) {
    
        navigationController?.popViewController(animated: true)
    }
}


