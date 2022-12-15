//
//  NewContactViewController.swift
//  conctactsAppManually
//
//  Created by NELSON ABEL  BARRANZUELA IMAN on 26/11/22.
//

import UIKit

class NewContactViewController: UIViewController {
    
    
    private var contact:Contact
    
    // 2.
    weak var delegate: NewConctactDelegateProtocol?
    
    // UI Elements
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    } ()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
       label.text = " Name         :"
       label.font = UIFont.preferredFont(forTextStyle: .headline)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    private let textFieldName: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = " Contact name "
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.textColor = .blue
        
        return txt
    }()
    
    private let jobTitleLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.preferredFont(forTextStyle: .headline)
       label.text = " Job Title    :"
       return label
    } ()
    
    private let textFieldJobTitle: UITextField = {
        let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.placeholder = " Job Title "
        txt.borderStyle = UITextField.BorderStyle.roundedRect
        txt.textColor = .blue
        return txt
    } ()
    
    private let aboutMeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = " About Me  :"
        return label
    } ()
    
    private let aboutMeTextView: UITextView = {
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor.blue
        textView.backgroundColor = UIColor.lightGray
        
        return textView
    } ()
    
    init() {
        self.contact = Contact(name: nil, jobTitle: nil, country: nil, aboutMe: nil)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        containerView.addSubview(nameLabel)
        containerView.addSubview(textFieldName)
        containerView.addSubview(jobTitleLabel)
        containerView.addSubview(textFieldJobTitle)
        containerView.addSubview(aboutMeLabel)
        containerView.addSubview(aboutMeTextView)
        
        view.addSubview(containerView)
        
        setUpAutoLayout()
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self,
                                         action: #selector(saveContact))
        
        navigationItem.rightBarButtonItem = saveButton
    }
    
    func setUpAutoLayout() {
        
        nameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        jobTitleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        aboutMeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
           
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            nameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            textFieldName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40),
            textFieldName.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10 ),
            textFieldName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            textFieldName.heightAnchor.constraint(equalToConstant: 40),
            
            jobTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            jobTitleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            jobTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            textFieldJobTitle.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 10),
            textFieldJobTitle.leadingAnchor.constraint(equalTo: jobTitleLabel.trailingAnchor, constant: 10),
            textFieldJobTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            textFieldJobTitle.heightAnchor.constraint(equalToConstant: 40),
            
            aboutMeLabel.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: 10),
            aboutMeLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            aboutMeLabel.heightAnchor.constraint(equalToConstant: 40),

            aboutMeTextView.topAnchor.constraint(equalTo: textFieldJobTitle.bottomAnchor, constant: 10),
            aboutMeTextView.leadingAnchor.constraint(equalTo: aboutMeLabel.trailingAnchor, constant: 10),
            aboutMeTextView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            aboutMeTextView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
        
    }
    
    func validaField()  -> Bool {
        return true
    }
    
//1. Protocol NewContactDelegateProtocol
    // 2. Hijo hacer referencia al caller
    // 3.  Hacer la implementacion del Protocol
    
    @objc func saveContact() {
       
        guard validaField() else { return }
        let model = Contact(name: textFieldName.text, jobTitle: textFieldJobTitle.text, country: "Peru", aboutMe: aboutMeTextView.text)
        
        print(" Saving new contact to data base ")
        delegate?.newContactDidAdded(contact: model)
        
       // Go back to root view controller
//       navigationController?.popToRootViewController(animated: true)
        
        navigationController?.popViewController(animated: true)
       
    }
}

// 1.
protocol NewConctactDelegateProtocol: AnyObject {
    func newContactDidAdded(contact: Contact)
}
