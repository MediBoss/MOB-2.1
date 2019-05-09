//
//  HomePageViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/14/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import CoreLocation
import Foundation
import UIKit

class HomePageViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var trips = [Trip](){
        didSet{
            tripsTableView.reloadData()
        }
    }
    
    lazy var tripsTableView: UITableView = {
       
        let tableview = UITableView()
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(TripTableViewCell.self, forCellReuseIdentifier: TripTableViewCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        return tableview
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tripsTableView)
        view.backgroundColor = .white

        setUpNavBar()
        layoutTableView()
        getUserCoordinates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /// Fetches and caches all the trips in memory before the view loads
        CoreDataStack.shared.fetchTrips { (result) in
            
            switch result{
            case let .success(trips):
                self.trips = trips
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
    /// Configures and styles the navigation bar on the home page
    private func setUpNavBar(){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        titleLabel.text = "Planned Trips"
        titleLabel.textColor = .red
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        navigationController?.navigationItem.titleView = titleLabel
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTripButtonTapped(_:)))
        navigationController?.navigationBar.isTranslucent = false
    }

    
    /// Apply auto layout on the main table view
    private func layoutTableView() {
        tripsTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }
    
    /// Navigates to the screen where a user can create a new trip
    @objc private func addTripButtonTapped(_ sender: UIBarButtonItem) {
        
        let destinationVC = AddTripViewController()
        navigationController?.show(destinationVC, sender: nil)
    }
    
    /// Propmt the user to grant access to the device's current location
    private func getUserCoordinates(){
        self.locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
}

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    
    // - MARK: UITableView Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tripCell = tripsTableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as! TripTableViewCell
        
        let currentTrip = trips[indexPath.row]
        tripCell.tripNameLabel.text = currentTrip.name
        
        return tripCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTrip = trips[indexPath.row]
        let destinationVC = TripDetailsViewController()
        
        destinationVC.currentTrip = selectedTrip
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let selectedTrip = self.trips[indexPath.row]
            CoreDataStack.shared.delete(object: selectedTrip)
            DispatchQueue.main.async {
                self.tripsTableView.reloadData()
            }
        }
    }
}
