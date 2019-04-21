//
//  TripTableViewCell.swift
//  TripStop
//
//  Created by Medi Assumani on 4/14/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import SnapKit
import UIKit

class TripTableViewCell: UITableViewCell {

    // - MARK: Class Properties
    static let identifier = "tripCellID"
    lazy var tripNameLabel = CustomLabel(fontSize: 10, text: "", textColor: .black, textAlignment: .center, fontName: "Helvetica-Medoum")
    
    // - MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(tripNameLabel)
        tripNameLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
