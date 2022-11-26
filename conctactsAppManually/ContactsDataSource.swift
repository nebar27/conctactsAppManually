//
//  ContactsDataSource.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 5/11/22.
//

import UIKit

class ContactsDataSource: NSObject, UITableViewDataSource {
    
    
    let contactaApi = ContactAPI.shared
    
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

