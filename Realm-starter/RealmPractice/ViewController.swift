//
//  ViewController.swift
//  RealmPractice
//
//  Created by Adriana González Martínez on 5/2/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let store = BookStore()
        let realm = try! Realm()
        store.realm = realm
        
//
//        let newBook = store.createBook(“A Game of Thrones (A Song of Ice and Fire #1)“, “George R. R. Martin", 1997)
        
        let newBook = store.createBook("A Game of Thrones (A Song of Ice and Fire #1)", "George R. R. Martin", 1997)
        
        //TODO: Save the book
        
        store.saveBook(newBook)
        
        //TODO: Find the book by title, print the result.
        
        let foundBook = store.findBooksByTitle(newBook.title)
        print(foundBook)
        
    }


}

