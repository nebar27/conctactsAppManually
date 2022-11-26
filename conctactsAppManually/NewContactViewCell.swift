//
//  NewContactViewCell.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 9/11/22.
//


import UIKit

class NewContactViewCell: UITableViewCell {

    // Take the best approach to name ReuseIdentifier, remenber some code lines
    
    let profileImage: UIImageView = {
        let personImage = UIImage(systemName: "person.crop.circle.badge.plus")
        let image = UIImageView(image: personImage)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        
        
       return image
    }()
    
    let labelPerson: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add New Contact"
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImage)
        self.contentView.addSubview(labelPerson)
        
        setUpAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpAutoLayout() {
        
        profileImage.contentHuggingPriority(for: .horizontal)
        profileImage.contentHuggingPriority(for: .vertical)
        
        NSLayoutConstraint.activate([
            
            profileImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            profileImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalTo:profileImage.widthAnchor, multiplier: 1.0/1.0),
            
            labelPerson.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            labelPerson.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            labelPerson.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            labelPerson.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
}
