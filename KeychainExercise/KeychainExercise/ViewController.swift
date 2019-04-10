//
//  ViewController.swift
//  KeychainExercise
//
//  Created by Medi Assumani on 4/10/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {

    let keychain = KeychainSwift()
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var saveMessageButton: UIButton!
    @IBOutlet weak var iCloudSyncSwitch: UISwitch!
    @IBOutlet weak var currentMessageLabel: UILabel!
    @IBOutlet weak var deleteMessageButon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveMessageButton.addTarget(self, action: #selector(saveButtonIsTapped(with:)), for: .touchUpInside)
        deleteMessageButon.addTarget(self, action: #selector(deleteButtonIsTapped(with:)), for: .touchUpInside)
        
    }
    

    @objc func saveButtonIsTapped(with sender: UIButton){
        
        guard let message = messageTextField.text else { return }
        
        // We dont do anything if there is no message to save
        if message.isEmpty{
            return
        }
        
        keychain.set(message, forKey: "messageKey")
        currentMessageLabel.text = message
    }
    
    @objc func deleteButtonIsTapped(with sender: UIButton){
        
        keychain.delete("messageKey")
        currentMessageLabel.text = "..." ?? "unknown"
    }
}

