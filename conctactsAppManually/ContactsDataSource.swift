//
//  ContactsDataSource.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 5/11/22.
//

import UIKit

class ContactsDataSource: NSObject, UITableViewDataSource {
    
    private let contacts = ContactAPI.getContact()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.setModel(contactModel: contacts[indexPath.item])
        return cell
    }
    
    
}

