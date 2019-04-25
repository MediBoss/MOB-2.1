//
//  SearchTableViewCell.swift
//  TripStop
//
//  Created by Medi Assumani on 4/25/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//
import UIKit

class SearchTableViewCell: UITableViewCell{
    
    static let identifier = "SearachTableViewCellID"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: SearchTableViewCell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
