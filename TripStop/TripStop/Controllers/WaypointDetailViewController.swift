//
//  WaypointDetailViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import MapKit
import UIKit

class WaypointDetailViewController: UIViewController {

    var waypoint: Waypoint?
    lazy var mapView = MKMapView.init()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = waypoint?.name
        view.addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        guard let name = waypoint?.name, let coordinates = waypoint?.coordinates else { return }
        LocationServices.shared.centerLocationOnMap(coordinates: coordinates, annotationTitle: name, map: mapView)
    }
}

