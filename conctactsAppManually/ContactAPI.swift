//
//  ContactAPI.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 18/10/22.
//
// This class must later consume the data from a restful endpoint

import Foundation

class ContactAPI {
    
    enum Section : String, CaseIterable {
        case addNew = "Add New"
        case addedContacts = "Contacts"
    }
    
    static let shared = ContactAPI()
    let sections = Section.allCases
    
    var data: [Section: [Contact]] = [
        .addedContacts:[Contact(name: "Kelly Goodwin", jobTitle: "Designer", country: "bo", aboutMe: "I am designer"),
        Contact(name: "Mohammad Hussain", jobTitle: "SEO Specialist", country: "be", aboutMe: "I am a SEO"),
        Contact(name: "John Young", jobTitle: "Interactive Designer", country: "af", aboutMe: "I am an Interactive Designer"),
        Contact(name: "Tamilarasi Mohan", jobTitle: "Architect", country: "al", aboutMe: "I am an Architect "),
        Contact(name: "Kim Yu", jobTitle: "Economist", country: "br", aboutMe: "I am designer an Economist "),
        Contact(name: "Derek Fowler", jobTitle: "Web Strategist", country: "ar", aboutMe: "I am Web Strategist"),
        Contact(name: "Shreya Nithin", jobTitle: "Product Designer", country: "az", aboutMe: "I am a Product Designer "),
        Contact(name: "Emily Adams", jobTitle: "Editor", country: "bo", aboutMe: "I am a Editor"),
        Contact(name: "Aabidah Amal", jobTitle: "Creative Director", country: "au", aboutMe: "I am a Creative Director"),
        Contact(name: "Jeans Ruiz", jobTitle: "IOS Developer", country: "pe", aboutMe: "I am IOS Developer "),
        Contact(name: "Kelly Goodwin", jobTitle: "Designer", country: "bo",aboutMe: "I am a designer"),
        Contact(name: "Mohammad Hussain", jobTitle: "SEO Specialist", country: "be", aboutMe: "I am SEO Specialist "),
        Contact(name: "Manuel Poblete", jobTitle: "Architect", country: nil, aboutMe: "I am a Software Architect ")]
    ]
    
    static func addContact(contact: Contact) {
        
    }
    
    func contact(at indexPath: IndexPath) ->Contact? {
        let category = sections[indexPath.section]
        return data[category]?[indexPath.item]
    }
    
}
