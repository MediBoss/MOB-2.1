//
//  TripDetailsViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/18/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import CoreLocation
import UIKit


class TripDetailsViewController: UIViewController {

    
    var currentTrip: Trip?
    
    lazy var waypointTableView: UITableView = {
        
        let tableview = UITableView()
        
        tableview.dataSource = self as UITableViewDataSource
        tableview.delegate = self as UITableViewDelegate
        tableview.register(WayPointTableViewCell.self, forCellReuseIdentifier: WayPointTableViewCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        
        return tableview
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBarItems()
        
        mainAutotLayout()
    }
    
    private func setUpNavigationBarItems(){
        
        guard let title = currentTrip?.name else { return }
        navigationItem.title = "Your Trip: \(title)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Waypoint", style: .done, target: self, action: #selector(addWaypointButonTapped(_:)))
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.alpha = 1
    }

    @objc private func addWaypointButonTapped(_ sender: UIBarButtonItem){
        
        let destinationVC = AddWaypointViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    private func mainAutotLayout() {
        
        view.addSubview(waypointTableView)
        waypointTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension TripDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = waypointTableView.dequeueReusableCell(withIdentifier: WayPointTableViewCell.identifier, for: indexPath) as! WayPointTableViewCell
//        let currentWaypoint = waypoints[indexPath.row]
//        cell.waypointNameLabel.text = currentWaypoint.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return currentTrip?.name ?? "Unknown"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let destinationVC = WaypointDetailViewController()
//        let selectedWaypoint = waypoints[indexPath.row]
//        destinationVC.waypoint = selectedWaypoint
//        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
