//
//  Helper.swift
//  TripStop
//
//  Created by Medi Assumani on 4/14/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

struct Helper {
    
    /// Configures and style a navigation bar with each components passed.
    static func layoutNavigationBar(navigationController: UINavigationController?, title: String, isTranslucent: Bool, leftBarItem: UIBarButtonItem?, rightBarItem: UIBarButtonItem?){
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        navigationController?.navigationItem.titleView = titleLabel
        navigationController?.navigationBar.isTranslucent = isTranslucent
        
        if leftBarItem != nil{
            navigationController?.navigationItem.leftBarButtonItem = leftBarItem
        }
        
        if rightBarItem != nil{
            navigationController?.navigationItem.rightBarButtonItem = rightBarItem
        }
    }
}
