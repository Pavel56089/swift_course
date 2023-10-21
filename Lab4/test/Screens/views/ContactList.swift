//
//  ContactData.swift
//  test
//
//  Created by Murat Shaikhutdinov on 20.10.2023.
//

import UIKit

class ContactList: UICollectionViewCell {
    private var contactName: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private var contactAvatar: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setUpView()
    }
    private func setUpView() {
        layer.cornerRadius = 20
        layer.borderColor = UIColor(red: 0.5, green: 0.48, blue: 1, alpha: 1).cgColor
        layer.borderWidth = 2
        layer.masksToBounds = true
        contentView.addSubview(contactAvatar)
        contentView.addSubview(contactName)
        setUpLayout()
    }
    private func setUpLayout() {
        contactAvatar.translatesAutoresizingMaskIntoConstraints = false
        contactName.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contactAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contactAvatar.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            contactAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactAvatar.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),

            contactName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contactName.leadingAnchor.constraint(equalTo: contactAvatar.trailingAnchor, constant: 16),
        ])
    }
    func configure(with contact: Contact) {
        contactName.text = contact.name
        contactAvatar.image = contact.image
    }
}

