//
//  ContactViewController.swift
//  test
//
//  Created by Pavel Bakharuev on 10.10.2023.
//

import UIKit
class ContactViewController: UIViewController {
    var contact: Contact?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let contactDataView = ContactData()
        if let contact = contact {
            contactDataView.configure(with: contact)
        }
        view.addSubview(contactDataView)
        contactDataView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contactDataView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
                contactDataView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                contactDataView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ])
    }
}

