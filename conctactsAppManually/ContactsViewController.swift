//
//  ContactsViewController.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 16/10/22.
//

import UIKit

// UITableViewDataSource
class ContactsViewController: UIViewController {
    
  
    private var dataSource = ContactsDataSource()
    private let contactsTableView = UITableView()
    private var contactViewDelegate:ContactsViewDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpNavigation()
        view.backgroundColor = .white
        
        view.addSubview(contactsTableView)
        
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        contactsTableView.register(NewContactViewCell.self, forCellReuseIdentifier: "NewContactViewCell")
        contactViewDelegate = ContactsViewDelegate(withDelegate: self)
        contactsTableView.dataSource = dataSource
        contactsTableView.delegate = contactViewDelegate
        tableViewConstraints()
        
    }
    
    func tableViewConstraints() {
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
   
    func setUpNavigation() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        
        self.navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    
    func getTableView() -> UITableView {
        return self.contactsTableView
    }
    
}

extension ContactsViewController: NewConctactDelegateProtocol {
    
    func newContactDidAdded(contact: Contact) {
        contactsTableView.beginUpdates()
        print("add model in Parent \(contact)")
        let category = dataSource.contactaApi.sections[1]
        dataSource.addContact( contact, to: category)
        //into the view
        
        let numberRowsInTableView = contactsTableView.numberOfRows(inSection: 1)
        let insertedIndex = IndexPath(item: numberRowsInTableView, section: 1)
        contactsTableView.insertRows(at: [insertedIndex], with: .right)
        contactsTableView.endUpdates()
        
    }
    
    
}
