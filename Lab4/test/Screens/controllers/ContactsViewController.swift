//
//  ContactsViewController.swift
//  test
//
//  Created by Pavel Bakharuev on 10.10.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    private var collectionView: UICollectionView!

    // Setting up the collection view
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9, height: 80)

        // Calculate the origin of the collection view to start below the header label
        let collectionViewFrame = CGRect(x: 0, y: 60, width: view.bounds.width, height: view.bounds.height - 60) // Adjust 'y' and height as needed

        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: "CustomCell")
        view.addSubview(collectionView)
    }

    
//    private func setupHeader() {
//            let headerLabel = UILabel()
//            headerLabel.text = "Contacts"
//            headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
//            headerLabel.textAlignment = .center
//            headerLabel.translatesAutoresizingMaskIntoConstraints = false
//
//            view.addSubview(headerLabel)
//
//            // Position the header label using Auto Layout
//            NSLayoutConstraint.activate([
//                headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//                headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            ])
//        }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
//        setupHeader()
    }
}

extension ContactsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // Number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }

    // Creating and configuring cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! ContactCell
        let contact = contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
    }

    // Handling cell selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedContact = contacts[indexPath.row]
        let contactVC = ContactViewController()
        contactVC.contact = selectedContact

        // Present the ParticularContactViewController, for example, using a navigation controller
        navigationController?.pushViewController(contactVC, animated: true)
    }
}
