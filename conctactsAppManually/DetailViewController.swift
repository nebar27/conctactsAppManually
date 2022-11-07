//
//  DetailViewController.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 22/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contact: Contact?
    
    private let detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
       return view
    } ()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name       :"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private let valueNameLabel:UILabel = {
        let label = UILabel()
        label.text = " Value Label "
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let jobTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "Job Title :"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let jobTitleValue: UILabel = {
        let label = UILabel()
        label.text = " Job Value"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        //view.backgroundColor = .white
        detailView.addSubview(nameLabel)
        detailView.addSubview(valueNameLabel)
        detailView.addSubview(jobTitleLabel)
        detailView.addSubview(jobTitleValue)
        
        view.addSubview(detailView)
        
        setUpAutoLayout()
        fillGuiWithValues()
    }
    
    func setUpAutoLayout() {
        
        NSLayoutConstraint.activate([
            
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            nameLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 40),
            nameLabel.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 40),
            nameLabel.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            valueNameLabel.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 40),
            valueNameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            valueNameLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -5),
            valueNameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            jobTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            jobTitleLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 10),
            jobTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            jobTitleValue.topAnchor.constraint(equalTo: valueNameLabel.bottomAnchor, constant: 5),
            jobTitleValue.leadingAnchor.constraint(equalTo: jobTitleLabel.trailingAnchor, constant: 10),
            jobTitleValue.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -5),
            jobTitleValue.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        jobTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        
    }
    
    func fillGuiWithValues() {
       
        if let contact = contact {
            valueNameLabel.text = contact.name
            jobTitleValue.text = contact.jobTitle
        }
    }
    

   
}
