//
//  ContactsViewDelegate.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 7/11/22.
//

import UIKit

class ContactsViewDelegate :NSObject, UITableViewDelegate {
    
    var contactsViewController: ContactsViewController?
    let contactaApi = ContactAPI.shared
    
    init(withDelegate delegate: ContactsViewController) {
        self.contactsViewController = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let newContactViewController = NewContactViewController()
//            Paso 3
            newContactViewController.delegate = contactsViewController
            contactsViewController?.navigationController?.pushViewController(newContactViewController, animated: true)
        } else {
            let category =  contactaApi.sections[indexPath.section]
            guard let contact = contactaApi.data[category]?[indexPath.row] else {
                return
            }
            let detailViewController = DetailViewController(contact: contact)
            contactsViewController?.navigationController?.pushViewController(detailViewController, animated: true )
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 60 : 20
            
    }
}
