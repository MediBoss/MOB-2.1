//
//  HomePageViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/14/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class HomePageViewController: UIViewController {

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
        
    }
    
    
    private func setUpNavBar(){
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        titleLabel.text = "Planned Trips"
        titleLabel.textColor = .red
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        
        navigationController?.navigationItem.titleView = titleLabel
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTripButtonTapped(_:)))
        navigationController?.navigationBar.isTranslucent = false
    }

    private func layoutTableView() {
        
        tripsTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
    }
    
    
    @objc private func addTripButtonTapped(_ sender: UIBarButtonItem) {
        
        let destinationVC = AddTripViewController()
        navigationController?.show(destinationVC, sender: nil)
    }
    
}

extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    
    // - MARK: UITableView Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tripCell = tripsTableView.dequeueReusableCell(withIdentifier: TripTableViewCell.identifier, for: indexPath) as! TripTableViewCell
        
        return tripCell
    }
}
