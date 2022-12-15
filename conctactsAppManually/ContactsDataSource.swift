//
//  ContactsDataSource.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 5/11/22.
//

import UIKit

class ContactsDataSource: NSObject, UITableViewDataSource {
    
    
    var contactaApi = ContactAPI.shared
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return 1
        } else {
            let category = contactaApi.sections[1]
            return contactaApi.data[category]!.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 1 ? " Contacts" : nil
    }
    
    // Analize this source code carefully 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath == IndexPath(row: 0, section: 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewContactViewCell", for: indexPath)
            return cell
        }
        let category =  contactaApi.sections[indexPath.section]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactTableViewCell
        else { fatalError(" Could not create ContactCell ") }
        let model = self.contactaApi.data[category]?[indexPath.item]
        cell.setModel(contactModel: model)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        contactaApi.sections.count
    }
    
    
    
}

extension ContactsDataSource {
    
    func addContact( _ contact: Contact, to category: ContactAPI.Section) {
        guard var contactData = self.contactaApi.data[category] else { return }
        contactData.append(contact)
        self.contactaApi.data.updateValue(contactData, forKey: category)
    }
    
    func deleteContact(at indexPath: IndexPath) {
        let category = contactaApi.sections[indexPath.section]
        guard var contactData = self.contactaApi.data[category] else { return }
        contactData.remove(at: indexPath.item)
        contactaApi.data.updateValue(contactData, forKey: category)
    }
    
    func deleteContact(at indexPaths: [IndexPath] ) {
        
        for indexPath in indexPaths {
            deleteContact(at: indexPath)
        }
        
    }
}
