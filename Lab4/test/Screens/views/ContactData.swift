//
//  ContactList.swift
//  test
//
//  Created by Pavel Bakharuev on 10.10.2023.
//
import UIKit

class ContactData: UIScrollView {
    // Create an image view to display the contact's image
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Create a label to display the contact's name
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    // Create a label to display the contact's phone number
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        // Customize label properties as needed
        return label
    }()
    
    // Initialize the ContactData view
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    // Required initializer for using in Interface Builder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // Set up the view hierarchy and constraints
    private func setupView() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(phoneLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints for the image view
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.8),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        // Constraints for the name label
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        // Constraints for the phone label
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            phoneLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16)
        ])
        
        // Set scroll view properties
        minimumZoomScale = 1
        maximumZoomScale = 1.5
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        
        // Adding a double-tap gesture recognizer for zooming
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(doubleTapRecognizer)
    }

    // Track the visibility of labels
    private var areLabelsVisible: Bool = true

    // Handle double tap gesture for zooming
    @objc private func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        if zoomScale == 1 {
            setZoomScale(1.3, animated: true)
        } else {
            setZoomScale(1, animated: true)
        }
    }

    // Configure the view with contact information
    func configure(with contact: Contact) {
        imageView.image = contact.image
        nameLabel.text = contact.name
        phoneLabel.text = contact.number
    }

    // Handle label visibility during zooming
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
    // Specify the view to zoom (the image view in this case)
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
