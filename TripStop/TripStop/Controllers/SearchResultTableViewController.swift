//
//  SearchResultTableViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/21/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import MapKit
import UIKit

class SearchResultTableViewController: UITableViewController {
    
    // - MARK: CLASS PROPERTIES
    var matchingItems: [MKMapItem] = []
    var mapView: MKMapView?
    
    override func viewDidLoad() {
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchingItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as! SearchTableViewCell
        let selectedItem = matchingItems[indexPath.row].placemark
        
        cell.textLabel?.text = selectedItem.name
        cell.detailTextLabel?.text = LocationServices.shared.parseAddress(selectedItem: selectedItem)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // zoom into that location
        let selectedWaypoint = matchingItems[indexPath.row].placemark
        let parsedAddress = LocationServices.shared.parseAddress(selectedItem: selectedWaypoint)
        LocationServices.shared.addressToCoordinate(parsedAddress) { (coordinates) in
            DispatchQueue.main.async {
                
                guard let coordinates = coordinates, let name = selectedWaypoint.name else { return }
                LocationServices.shared.centerLocationOnMap(coordinates: coordinates,
                                                            annotationTitle: name,
                                                            map: self.mapView!)
                
                
                let destinationVC  = AddWaypointViewController()
                destinationVC.wayPoint = Waypoint(name: name, coordinates: coordinates)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

extension SearchResultTableViewController: UISearchResultsUpdating {
    
    /// Fetches waypoints entered by the user and returns the result that matches the search query
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let mapView = mapView, let searchBarText = searchController.searchBar.text else { return }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if error == nil {
                guard let response = response else { return }
                self.matchingItems = response.mapItems
                self.tableView.reloadData()
            }
        }
    }
}
