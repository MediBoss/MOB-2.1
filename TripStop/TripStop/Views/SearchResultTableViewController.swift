//
//  SearchResultTableViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/21/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class SearchResultTableViewController: UITableViewController {
    override func viewDidLoad() {
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
    }
}

extension SearchResultTableViewController: UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        // TODO - Updated search based on Google Place API
    }
}

class SearchTableViewCell: UITableViewCell{
    
    static let identifier = "SearachTableViewCellID"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: SearchTableViewCell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
