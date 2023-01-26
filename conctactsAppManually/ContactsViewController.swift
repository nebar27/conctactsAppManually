//
//  ContactsViewController.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 16/10/22.
//

import UIKit

//class ContactsViewController: UITableViewController {
//
//
//
//}

// UITableViewDataSource
class ContactsViewController_temp: UIViewController {
    
//    UIViewController {
    
  
    private var dataSource = ContactsDataSource()
    private let contactsTableView = UITableView()
    private var contactViewDelegate:ContactsViewDelegate?
    
    private var deleteButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(someAction))
        setUpNavigation()
        view.backgroundColor = .white
        
        view.addSubview(contactsTableView)
        
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        contactsTableView.register(NewContactViewCell.self, forCellReuseIdentifier: "NewContactViewCell")
        contactViewDelegate = ContactsViewDelegate(withDelegate: self)
        contactsTableView.dataSource = dataSource
        contactsTableView.delegate = contactViewDelegate
        
        
        //contactsTableView.allowsMultipleSelection = true
        tableViewConstraints()
        
    }
    
    @objc func someAction() {
        print("This is some action from an event ")
    }
        
    
//    override func setEditing(_ editing: Bool, animated: Bool) {
//
//        super.setEditing(editing, animated: animated)
//        deleteButton.isEnabled = isEditing
//
//        contactsTableView.indexPathsForVisibleRows?.forEach {
//            guard let contactCell = contactsTableView.cellForRow(at: $0) as? ContactTableViewCell else { return }
//            contactCell.isEditing = editing
//        }
//
//        if !isEditing {
//            contactsTableView.indexPathsForSelectedRows?.compactMap({ $0 } ).forEach {
//                contactsTableView.deselectRow(at: $0, animated: true)
//            }
//        }
//
//    }
    
    func tableViewConstraints() {
        
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contactsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contactsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
   
    func setUpNavigation() {
        
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        
        self.navigationItem.title = "Contacts"
//        self.navigationItem.leftBarButtonItem = editButtonItem
//        self.navigationItem.rightBarButtonItem = deleteButton
        deleteButton.isEnabled = false
//        self.navigationController?.navigationBar.standardAppearance = appearance
//        self.navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    
    func getTableView() -> UITableView {
        return self.contactsTableView
    }
    
}

extension ContactsViewController_temp: NewConctactDelegateProtocol {
    
    func newContactDidAdded(contact: Contact) {
        
        print("add model in Parent \(contact)")
        let category = self.dataSource.contactaApi.sections[1]
        self.dataSource.addContact( contact, to: category)
        let numberRowsInTableView = contactsTableView.numberOfRows(inSection: 1)
        let insertedIndex = IndexPath(item: numberRowsInTableView, section: 1)
            //contactsTableView.beginUpdates()
        contactsTableView.insertRows(at: [insertedIndex], with: .right)
            //contactsTableView.endUpdates()
        
    }
    
    
}
