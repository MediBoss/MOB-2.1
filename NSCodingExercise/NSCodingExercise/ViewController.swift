//
//  ViewController.swift
//  NSCodingExercise
//
//  Created by Medi Assumani on 4/10/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var movie = Movie(title: "Rush Hour 4", duration: 2)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    
    // Archiving
    func archiveMovie(){
        
        let data = NSKeyedArchiver.archivedData(withRootObject: movie)
        UserDefaults.standard.set(data, forKey: "movie")
    }

    // Unarchiving
    func unArchiveMovie(){
        
        if let data = UserDefaults.standard.data(forKey: "movie") {
            let movie = NSKeyedUnarchiver.unarchiveObject(with: data)
        }
    }
}

