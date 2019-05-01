//
//  AddTripViewController.swift
//  TripStop
//
//  Created by Medi Assumani on 4/14/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    lazy var tripNameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Give this trip a Name!"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var tripNameTextField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Trip Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setUpNavigationBarItems()
        mainAutoLayout()
    }

    private func setUpNavigationBarItems(){
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        // Styling the home page title
        titleLabel.text = "Add Trip"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = .white
        
        navigationItem.titleView = titleLabel
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addTripButtonTapped(_:)))
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.alpha = 1
    }
    
    @objc private func addTripButtonTapped(_ sender: UIBarButtonItem){
        
        guard let tripName = tripNameTextField.text else { return }
        
        
        
        let trip = CoreDataStack.shared.create()
        trip.name = tripName
        CoreDataStack.shared.save()
        navigationController?.popViewController(animated: true)
    }
    
    private func mainAutoLayout(){
        
        let stackView = UIStackView(arrangedSubviews: [tripNameLabel, tripNameTextField])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20))
        }
    }
}
