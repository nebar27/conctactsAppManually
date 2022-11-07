//
//  ContactsViewDelegate.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 7/11/22.
//

import UIKit

class ContactsViewDelegate :NSObject, UITableViewDelegate {
    
    var contactsViewController: ContactsViewController?
    
    init(withDelegate delegate: ContactsViewController) {
        self.contactsViewController = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = self.contactsViewController?.getContactsModel()[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.contact = contact
        contactsViewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
