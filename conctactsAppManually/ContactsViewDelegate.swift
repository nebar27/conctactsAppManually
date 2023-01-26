//
//  ContactsViewDelegate.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 7/11/22.
//

import UIKit

class ContactsViewDelegate :NSObject, UITableViewDelegate {
    
    var contactsViewController: ContactsViewController_temp?
    let contactaApi = ContactAPI.shared
    
    init(withDelegate delegate: ContactsViewController_temp) {
        self.contactsViewController = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if indexPath.section == 0 {
//            let newContactViewController = NewContactViewController()
////            Paso 3
//            newContactViewController.delegate = contactsViewController
//            contactsViewController?.navigationController?.pushViewController(newContactViewController, animated: true)
//        } else {
//            let category =  contactaApi.sections[indexPath.section]
//            guard let contact = contactaApi.data[category]?[indexPath.row] else {
//                return
//            }
//            let detailViewController = DetailViewController(contact: contact)
//            contactsViewController?.navigationController?.pushViewController(detailViewController, animated: true )
//        }
       
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if indexPath.section == 1 {
//            return .delete
//        }
//        return .none
//    }
//
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
    
//    func tableView(_ tableView: UITableView, commit editingStyleForRowAt: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
//        if editingStyleForRowAt == .delete{
//            tableView.beginUpdates()
//            items.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            tableView.endUpdates()
//        }
//    }
    
    

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 60 : 20
            
    }
}
