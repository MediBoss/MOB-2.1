//
//  Defaults.swift
//  UserDefaultsExercise
//
//  Created by Medi Assumani on 4/3/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation

struct Defaults{
    
    static let token = "token"
    static let tokenKey = "tokenKey"
    
    
    struct Model {
        var token: String?
        
        init(token: String) {
            //complete the initializer
            self.token = token
        }
        
    }
    
    static var saveToken = { (token: String) in
        //complete the method
        UserDefaults.standard.set(Model(token: token), forKey: Defaults.tokenKey)
    }
    
    static var getToken = { () -> Model in
        //complete the method
        let token = UserDefaults.standard.string(forKey: Defaults.tokenKey)
        return Model(token: token ?? "")
    }
    
    static func clearUserData(){
        //complete the method using removeObject
        UserDefaults.standard.removeObject(forKey: Defaults.tokenKey)
    }
}
