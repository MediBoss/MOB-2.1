//
//  Item+CoreDataProperties.swift
//  loaner
//
//  Created by Medi Assumani on 4/4/19.
//  Copyright © 2019 LinnierGames. All rights reserved.
//
//

import CoreData
import Foundation
import UIKit.UIImage



extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var itemImage: UIImage
    @NSManaged public var itemTitle: String
    @NSManaged public var loanee: Loanee
    @NSManaged public var notes: String
}
