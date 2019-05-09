//
//  TripDetailsViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/18/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import CoreLocation
import UIKit
import CoreData


class TripDetailsViewController: UIViewController {

    
    var currentTrip: Trip!
    
    lazy var fetchedResultsController: NSFetchedResultsController<Waypoint> = {
        let fetchRequest: NSFetchRequest<Waypoint> = Waypoint.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "trip = %@", currentTrip)
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: CoreDataStack.shared.peristentContainer.viewContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        return fetchedResultsController
    }()
    
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
        waypointTableView.reloadData()
    }
    
    private func setUpNavigationBarItems(){
        
        guard let title = currentTrip?.name else { return }
        navigationItem.title = "\(title)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Waypoint", style: .done, target: self, action: #selector(addWaypointButonTapped(_:)))
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.alpha = 1
    }

    @objc private func addWaypointButonTapped(_ sender: UIBarButtonItem){
        
        let destinationVC = AddWaypointViewController()
        
        guard let unwrappedTrip = self.currentTrip else { return }
        destinationVC.parentTrip = unwrappedTrip
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
        
        guard let sectionInfo = fetchedResultsController.sections?[section] else {
            return 0
        }
        
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = waypointTableView.dequeueReusableCell(withIdentifier: WayPointTableViewCell.identifier, for: indexPath) as! WayPointTableViewCell
        
        let currentWaypoint = self.fetchedResultsController.object(at: indexPath)
        cell.waypointNameLabel.text = currentWaypoint.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Waypoints to \(currentTrip?.name ?? "Unknown")"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            CoreDataStack.shared.delete(object: fetchedResultsController.object(at: indexPath))
            DispatchQueue.main.async {
                self.waypointTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destinationVC = WaypointDetailViewController()
        let selectedWaypoint = fetchedResultsController.object(at: indexPath)
        destinationVC.waypoint = selectedWaypoint
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
