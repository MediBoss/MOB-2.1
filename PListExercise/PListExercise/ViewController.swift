//
//  ViewController.swift
//  PListExercise
//
//  Created by Medi Assumani on 4/3/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

struct People{
    
    let name: String?
    let score: Int?
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var people = [People](){
        didSet{
            tableview.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readToPlist()
    }


    func readToPlist(){
        
        var format = PropertyListSerialization.PropertyListFormat.xml
        var data: [String: AnyObject] = [:]
        let path: String? = Bundle.main.path(forResource: "Scores", ofType: "plist")!
        let xmlContents = FileManager.default.contents(atPath: path!)!
        
        do{
            data = try PropertyListSerialization.propertyList(from: xmlContents, options: .mutableContainersAndLeaves, format: &format) as! [String: AnyObject]
            
            let rootArray = data["Scores"] as![ [String: Any] ]
            rootArray.forEach { (currentElement) in
                people.append(People(name: currentElement["Name"] as! String, score: currentElement["Score"] as! Int))
            }
            
        } catch {
            print("Error reading plist")
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlistTableViewCell
        
        cell.nameLabel.text = self.people[indexPath.row].name
        cell.scoreLabel.text = String(self.people[indexPath.row].score!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Highest Scores 🚀"
    }
}

