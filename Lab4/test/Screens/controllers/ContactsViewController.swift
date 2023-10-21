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
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9, height: 100)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: "CustomCell")
        view.addSubview(collectionView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
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
