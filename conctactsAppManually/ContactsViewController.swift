//
//  ContactsViewController.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 16/10/22.
//

import UIKit

// UITableViewDataSource
class ContactsViewController: UIViewController, UITableViewDelegate  {
    
  
    private let contactsTableView = UITableView()
    private let contacts = ContactAPI.getContact()
    private var dataSource = ContactsDataSource()
    private var contactViewDelegate:ContactsViewDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(contactsTableView)
        
        tableViewConstraints()
        contactsTableView.delegate = self
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        contactViewDelegate = ContactsViewDelegate(withDelegate: self)
        contactsTableView.dataSource = dataSource
        contactsTableView.delegate = contactViewDelegate
        
        setUpNavigation()
      
        
    }
    
    func tableViewConstraints() {
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
   
    func setUpNavigation() {
        
        navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    
    func getContactsModel() -> [Contact] {
        return self.contacts
    }

    
}
