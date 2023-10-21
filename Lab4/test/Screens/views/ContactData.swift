//
//  ContactList.swift
//  test
//
//  Created by Murat Shaikhutdinov on 20.10.2023.
//

import UIKit


class ContactData: UIScrollView {
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        // Set label properties as needed
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(phoneLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            phoneLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16)
        ])
        
        minimumZoomScale = 1
        maximumZoomScale = 1.5
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
            doubleTapRecognizer.numberOfTapsRequired = 2
            addGestureRecognizer(doubleTapRecognizer)
    }

    private var areLabelsVisible: Bool = true

    @objc private func handleDoubleTap(_ sender: UITapGestureRecognizer) {
            if zoomScale == 1 {
                setZoomScale(1.3, animated: true)
                areLabelsVisible = false
                nameLabel.alpha = 0
                phoneLabel.alpha = 0
            } else {
                setZoomScale(1, animated: true)
                areLabelsVisible = true
                nameLabel.alpha = 1
                phoneLabel.alpha = 1
            }
        }
    func configure(with contact: Contact) {
        imageView.image = contact.image
        nameLabel.text = contact.name
        phoneLabel.text = contact.number
    }


    func scrollViewDidZoom(_ scrollView: UIScrollView) {
            if zoomScale != 1 {
                nameLabel.alpha = 0
                phoneLabel.alpha = 0
            } else {
                nameLabel.alpha = 1
                phoneLabel.alpha = 1
            }
        }
}
extension ContactData: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

